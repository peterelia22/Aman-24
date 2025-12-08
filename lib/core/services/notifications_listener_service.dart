import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_project/contants.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/core/utils/shared_preferences_singleton.dart';

import 'local_notification_service.dart';

/// Listens to Firestore notifications collection and shows local notifications.
class NotificationsListenerService {
  NotificationsListenerService._();

  static final NotificationsListenerService instance =
      NotificationsListenerService._();

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _subscription;
  static const _lastSeenKey = 'notifications_last_seen_ts';
  int? _lastSeenMs;

  /// Start listening for new documents for current user.
  Future<void> start() async {
    final userJson = SharedPreferencesSingleton.getString(kUserData);
    if (userJson.isEmpty) {
      // Skip starting the listener until a user logs in and persists data.
      return;
    }

    final uid = getUser().uId;

    await stop();
    _lastSeenMs = _loadLastSeen();

    _subscription = FirebaseFirestore.instance
        .collection('notifications')
        .where('userId', isEqualTo: uid)
        // Your documents use field name "timestamp" per sample payload
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
          // On first launch with no stored lastSeen, initialize it to latest doc to avoid re-notifying all
          if (_lastSeenMs == null && snapshot.docs.isNotEmpty) {
            final maxTs = snapshot.docs
                .map((d) => _extractTimestampMs(d.data()['timestamp']))
                .whereType<int>()
                .fold<int>(0, max);
            if (maxTs > 0) {
              _lastSeenMs = maxTs;
              _persistLastSeen(maxTs);
            }
            return;
          }

          int? newestMs;
          for (final change in snapshot.docChanges) {
            if (change.type == DocumentChangeType.added) {
              final data = change.doc.data();
              if (data == null) continue;

              final tsMs = _extractTimestampMs(data['timestamp']);
              if (_lastSeenMs != null && tsMs != null && tsMs <= _lastSeenMs!) {
                continue; // already seen
              }

              // Fields per your sample doc: title, message, status, reportId, timestamp, isRead, userId
              final title = (data['title'] as String?) ?? 'New notification';
              final body = (data['message'] as String?) ?? '';
              final reportId = (data['reportId'] as String?) ?? '';
              final notificationId = change.doc.id;

              // Use doc hashCode as notification id to avoid clashes
              // Pack notificationId|reportId in payload for tap handling
              final payload = '$notificationId|$reportId';

              LocalNotificationService.instance.show(
                id: notificationId.hashCode,
                title: title,
                body: body,
                payload: payload,
              );

              if (tsMs != null) {
                newestMs = max(newestMs ?? tsMs, tsMs);
              }
            }
          }

          if (newestMs != null) {
            _lastSeenMs = max(_lastSeenMs ?? 0, newestMs);
            _persistLastSeen(_lastSeenMs!);
          }
        }, onError: (error, stack) {
          // Avoid crashing the app if Firestore rules deny access; surface once.
          // Common case: Firestore security rules not allowing this user to read their notifications.
          // Update rules to permit: allow read: if request.auth != null && request.auth.uid == resource.data.userId;
          // Also ensure user is logged in before starting the listener.
        });
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  int? _loadLastSeen() {
    final stored = SharedPreferencesSingleton.getString(_lastSeenKey);
    if (stored.isEmpty) return null;
    final parsed = int.tryParse(stored);
    return parsed;
  }

  void _persistLastSeen(int ms) {
    SharedPreferencesSingleton.setString(_lastSeenKey, ms.toString());
  }

  int? _extractTimestampMs(dynamic value) {
    if (value is Timestamp) return value.millisecondsSinceEpoch;
    if (value is int) return value;
    if (value is double) return value.toInt();
    return null;
  }
}
