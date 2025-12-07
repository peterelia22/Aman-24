import 'package:depi_project/core/theme/app_theme.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/core/helpers/report_status_helper.dart';
import 'package:depi_project/core/helpers/theme_helper.dart';
import 'package:depi_project/core/widgets/status_chip.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:depi_project/features/reports/presentation/widgets/media_thumbnail.dart';

class ReportDetailsScreen extends StatelessWidget {
  final ReportEntity report;

  const ReportDetailsScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: S.of(context).reportDetails),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              report.title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 16.h),

            Row(
              children: [
                Text(
                  S.of(context).status,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                StatusChip(
                  label: report.getStatusDisplayName(context),
                  statusColor: getStatusColor(report.status),
                ),
              ],
            ),
            const Divider(height: 32),

            Text(
              S.of(context).description,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(report.description, style: TextStyle(fontSize: 16.sp)),
            const Divider(height: 32),

            if (report.address != null && report.address!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).address,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppTheme.darkGrey),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          report.address!,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                ],
              ),

            // (Media)
            if (report.mediaUrls.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).media,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: report.mediaUrls.length > 4
                          ? 4
                          : report.mediaUrls.length,
                      itemBuilder: (context, index) {
                        final url = report.mediaUrls[index];
                        final showMore =
                            index == 3 && report.mediaUrls.length > 4;
                        final remaining = showMore
                            ? report.mediaUrls.length - 4
                            : 0;
                        return Padding(
                          padding: EdgeInsets.only(right: 8.0.w),
                          child: MediaThumbnail(
                            mediaUrl: url,
                            showMoreIndicator: showMore,
                            remainingCount: remaining,
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 32),
                ],
              ),

            // (Admin Comment)
            if (report.adminComment != null && report.adminComment!.isNotEmpty)
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: ThemeHelper.getSurfaceColor(context),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppTheme.darkGrey.withOpacity(0.5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).adminComment,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        report.adminComment!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
