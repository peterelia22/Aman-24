import 'package:depi_project/core/theme/app_theme.dart';
import 'package:depi_project/core/entities/report_entity.dart';
import 'package:depi_project/core/enums/report_status_enums.dart';
import 'package:depi_project/core/widgets/status_chip.dart';
import 'package:depi_project/features/reports/presentation/views/report_details_screen.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportDetailCard extends StatelessWidget {
  final ReportEntity data;
  const ReportDetailCard({super.key, required this.data});

  Color _getReportStatusColor(ReportStatusEnum status) {
    switch (status) {
      case ReportStatusEnum.pending:
        return Colors.blueGrey.shade500;
      case ReportStatusEnum.inReview:
        return Colors.amber.shade700;
      case ReportStatusEnum.investigating:
        return Colors.orange.shade700;
      case ReportStatusEnum.resolved:
        return Colors.green.shade600;
      case ReportStatusEnum.rejected:
        return Colors.red.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportDetailsScreen(report: data),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.w),
        elevation: 2,
        shadowColor: AppTheme.black,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(255, 38, 41, 43)
            : AppTheme.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      data.title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  StatusChip(
                    label: data.getStatusDisplayName(context),
                    statusColor: _getReportStatusColor(data.status),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Text(
                data.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 12.sp,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              if (data.address != null && data.address!.isNotEmpty)
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16.sp,
                      color: AppTheme.darkGrey,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        data.address!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 12.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 8.h),
              Text(
                '${S.of(context).reportDate} : ${data.createdAt.day}/${data.createdAt.month}/${data.createdAt.year} ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
