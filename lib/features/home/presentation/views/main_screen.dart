import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/core/services/get_it_service.dart';
import 'package:depi_project/features/add_report/presentation/views/add_report_view.dart';
import 'package:depi_project/features/home/presentation/views/home_layout.dart';
import 'package:depi_project/features/profile/presentation/views/profile_view.dart';
import 'package:depi_project/core/widgets/notification_badge_icon.dart';
import 'package:depi_project/features/notifications/domain/repos/notifications_repo.dart';
import 'package:depi_project/core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:depi_project/features/notifications/presentation/views/notifications_view.dart';
import 'package:depi_project/features/reports/presentation/views/repports_body.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  late final GetNotificationsCubit notificationsCubit;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    final repo = getIt.get<NotificationsRepo>();
    final userId = getUser().uId;
    notificationsCubit = GetNotificationsCubit(repo)
      ..getUserNotifications(userId);

    screens = [
      const HomeLayout(),
      const RepportsBody(),
      BlocProvider.value(
        value: notificationsCubit,
        child: const NotificationsView(provideCubit: false),
      ),
      const ProfileView(),
    ];
  }

  @override
  void dispose() {
    notificationsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,

      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromARGB(
          255,
          255,
          255,
          255,
        ), // خلفية غامقة أنيقة
        body: IndexedStack(index: currentIndex, children: screens),

        floatingActionButton: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: FloatingActionButton(
            backgroundColor: const Color(0xFFFF6B5E),
            elevation: 6,
            shape: const CircleBorder(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const AddReportView(),
              );
            },
            child: const Icon(Icons.add, size: 32, color: Colors.white),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // 🔸 الشريط السفلي
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
            bloc: notificationsCubit,
            builder: (context, state) {
              final unreadCount = state is GetNotificationsSuccess
                  ? state.notifications.where((n) => !n.isRead).length
                  : 0;

              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                currentIndex: currentIndex,
                selectedItemColor: const Color(0xFFFF6B5E),
                unselectedItemColor: Theme.of(context).unselectedWidgetColor,
                selectedFontSize: 11,
                unselectedFontSize: 10,
                iconSize: 24,
                onTap: (index) => setState(() => currentIndex = index),
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: S.of(context).home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.receipt_long),
                    label: S.of(context).myReports,
                  ),
                  BottomNavigationBarItem(
                    icon: NotificationBadgeIcon(count: unreadCount),
                    label: S.of(context).notifications,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person),
                    label: S.of(context).profile,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
