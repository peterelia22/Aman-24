import 'package:animate_do/animate_do.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecurityTipsPage extends StatelessWidget {
  SecurityTipsPage({super.key});

  List<Map<String, dynamic>> _getTips(BuildContext context) {
    return [
      {
        "icon": Icons.lock,
        "color": Colors.blueAccent,
        "text": S.of(context).tip1,
      },
      {
        "icon": Icons.link_off,
        "color": const Color.fromARGB(255, 212, 34, 34),
        "text": S.of(context).tip2,
      },
      {"icon": Icons.https, "color": Colors.green, "text": S.of(context).tip3},
      {
        "icon": Icons.security,
        "color": Colors.orangeAccent,
        "text": S.of(context).tip4,
      },
      {
        "icon": Icons.vpn_lock,
        "color": Colors.teal,
        "text": S.of(context).tip5,
      },
      {
        "icon": Icons.password,
        "color": Colors.purple,
        "text": S.of(context).tip6,
      },
      {
        "icon": Icons.backup,
        "color": Colors.indigo,
        "text": S.of(context).tip7,
      },
      {
        "icon": Icons.warning,
        "color": const Color.fromARGB(255, 226, 69, 22),
        "text": S.of(context).tip8,
      },
      {
        "icon": Icons.wifi_off,
        "color": const Color.fromARGB(255, 81, 56, 47),
        "text": S.of(context).tip9,
      },
      {"icon": Icons.update, "color": Colors.cyan, "text": S.of(context).tip10},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    final tips = _getTips(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(context, title: S.of(context).securityTips),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return FadeInUp(
            delay: Duration(milliseconds: 100 * index),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color.fromARGB(255, 38, 41, 43)
                    : Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: isDarkMode
                      ? Colors.grey.shade700
                      : Colors.grey.shade200,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? Colors.black.withOpacity(0.4)
                        : Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: tip["color"].withOpacity(0.15),
                  child: Icon(tip["icon"], color: tip["color"]),
                ),
                title: Text(
                  tip["text"],
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 15.sp,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
