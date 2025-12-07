import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:depi_project/core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:depi_project/core/helpers/build_snack_bar.dart';
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
        if (state is GetNotificationsInitial) {
          return const SizedBox.shrink();
        }

        if (state is GetNotificationsLoading) {
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

    try {
      final cubit = context.read<GetNotificationsCubit>();

      // If notification is unread (first time), just mark it as read
      if (!notification.isRead) {
        await cubit.markAsRead(notification);
        return; // Don't open the report
      }

      // If notification is already read, show loading and open the report
      if (!mounted) return;

      setState(() {
        _isProcessing = true;
      });

      final reportResult = await cubit.notificationsRepo.getReportById(
        notification.reportId,
      );

      if (!mounted) return;

      setState(() {
        _isProcessing = false;
      });

      if (!context.mounted) return;

      reportResult.fold(
        (failure) {
          buildSnackBar(
            context: context,
            title: S.of(context).error,
            message: getErrorMessage(context, failure.message),
            contentType: ContentType.failure,
          );
        },
        (report) async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ReportDetailsScreen(report: report),
            ),
          );
        },
      );
    } catch (e) {
      if (!mounted) return;
      if (_isProcessing) {
        setState(() {
          _isProcessing = false;
        });
      }
      if (!context.mounted) return;
      buildSnackBar(
        context: context,
        title: S.of(context).error,
        message: S.of(context).unexpectedError,
        contentType: ContentType.failure,
      );
    }
  }
}
