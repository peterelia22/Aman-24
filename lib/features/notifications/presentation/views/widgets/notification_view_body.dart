import 'package:depi_project/core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:depi_project/core/helpers/error_message_helper.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/report_notification_entity.dart';
import '../../../../reports/presentation/views/report_details_screen.dart';
import 'notification_card.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
      builder: (context, state) {
        if (state is GetNotificationsLoading ||
            state is GetNotificationsInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetNotificationsFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                getErrorMessage(context, state.message),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 16.sp),
              ),
            ),
          );
        }

        if (state is GetNotificationsSuccess) {
          if (state.notifications.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noNotfi,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
            );
          }

          return Stack(
            children: [
              ListView.separated(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 70,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: state.notifications.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];
                  return NotificationCard(
                    notification: notification,
                    isProcessing: _isProcessing,
                    onTap: () => _handleNotificationTap(notification),
                  );
                },
              ),
              if (_isProcessing)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16.h),
                            Text(
                              S.of(context).loading,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Future<void> _handleNotificationTap(
    ReportNotificationEntity notification,
  ) async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final cubit = context.read<GetNotificationsCubit>();
      final result = await cubit.handleNotificationTap(notification);

      if (!mounted) return;

      setState(() {
        _isProcessing = false;
      });

      if (!context.mounted) return;

      switch (result.action) {
        case NotificationTapAction.markedAsRead:
          break;

        case NotificationTapAction.openReport:
          if (result.report != null) {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ReportDetailsScreen(report: result.report!),
              ),
            );
          }
          break;

        case NotificationTapAction.error:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                result.errorMessage != null
                    ? getErrorMessage(context, result.errorMessage!)
                    : S.of(context).unexpectedError,
              ),
              backgroundColor: Colors.red,
            ),
          );
          break;
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isProcessing = false;
      });
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).unexpectedError),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
