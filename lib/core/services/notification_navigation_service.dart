import 'package:depi_project/core/services/navigation_service.dart';
import 'package:depi_project/features/notifications/domain/repos/notifications_repo.dart';
import 'package:depi_project/features/reports/presentation/views/report_details_screen.dart';
import 'package:flutter/material.dart';

import 'get_it_service.dart';

/// Handles navigation when a local notification is tapped.
class NotificationNavigationService {
  NotificationNavigationService._();

  static Future<void> handlePayload(String? payload) async {
    if (payload == null || payload.isEmpty) return;

    // payload format: notificationId|reportId
    final parts = payload.split('|');
    final notificationId = parts.isNotEmpty ? parts.first : '';
    final reportId = parts.length > 1 ? parts[1] : '';

    final repo = getIt.get<NotificationsRepo>();

    // Mark as read if we have notification id
    if (notificationId.isNotEmpty) {
      await repo.markNotificationAsRead(notificationId);
    }

    // Navigate only if reportId is present
    if (reportId.isEmpty) return;

    final result = await repo.getReportById(reportId);

    final navigator = navigatorKey.currentState;
    if (navigator == null) return;

    result.fold((_) {}, (report) {
      navigator.push(
        MaterialPageRoute(builder: (_) => ReportDetailsScreen(report: report)),
      );
    });
  }
}
