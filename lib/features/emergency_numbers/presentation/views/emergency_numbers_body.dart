import 'package:depi_project/core/theme/app_theme.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/features/emergency_numbers/presentation/views/widgets/widget_emergency_numbers.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmergencyNumbersBody extends StatelessWidget {
  const EmergencyNumbersBody({super.key});
  static const String routeName = 'emergency_numbers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(context, title: S.of(context).emergencyNumbers),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).usingEmergencyNumbers,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.info, color: AppTheme.primaryColor, size: 24.sp),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24.h),
            WidgetEmergencyNumbers(
              icon: Icons.local_hospital,
              text1: S.of(context).ambulance,
              number: "123",
            ),
            SizedBox(height: 16.h),
            WidgetEmergencyNumbers(
              icon: Icons.local_police,
              text1: S.of(context).police,
              number: "122",
            ),
            SizedBox(height: 16.h),
            WidgetEmergencyNumbers(
              icon: Icons.fire_extinguisher,
              text1: S.of(context).fireFighters,
              number: "180",
            ),
            SizedBox(height: 16.h),
            WidgetEmergencyNumbers(
              icon: Icons.support_agent,
              text1: S.of(context).helpLine,
              number: "15044",
            ),
            SizedBox(height: 16.h),
            WidgetEmergencyNumbers(
              icon: Icons.electrical_services,
              text1: S.of(context).electricalEmergency,
              number: "121",
            ),
            SizedBox(height: 16.h),
            WidgetEmergencyNumbers(
              icon: Icons.local_fire_department,
              text1: S.of(context).fireEmergency,
              number: "180",
            ),
            SizedBox(height: 16.h),
            WidgetEmergencyNumbers(
              icon: Icons.water_drop,
              text1: S.of(context).water,
              number: "125",
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
