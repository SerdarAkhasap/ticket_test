import 'package:flutter/material.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/assets.gen.dart';
import 'package:online_plane_ticket/app/utils/router.dart';

class App extends StatefulWidget {
  const App({super.key, required this.child});

  final Widget child;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedNavItem = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border:
                  Border(top: BorderSide(width: 1, color: AppColors.grey1))),
          child:
          BottomNavigationBar(
            onTap: (index)  {
              if (_selectedNavItem != index) {
                changeNavBar(context, index);
                setState(() {
                  _selectedNavItem = index;
                });
              }
            },
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            showUnselectedLabels: true,
            enableFeedback: false,
            selectedLabelStyle: const TextStyle(fontSize: 10),
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            selectedItemColor: AppColors.darkBlue,
            unselectedItemColor: AppColors.grey5,
            backgroundColor: AppColors.black,
            currentIndex: _selectedNavItem,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Assets.icons.plane.svg(color: _selectedNavItem == 0
                      ? AppColors.darkBlue
                      : AppColors.grey5),
                  label: "Авиабилеты"),
              BottomNavigationBarItem(
                  icon: Assets.icons.hotels.svg(
                      color: _selectedNavItem == 1
                          ? AppColors.darkBlue
                          : AppColors.grey5),
                  label: "Отели"),
              BottomNavigationBarItem(
                  icon: Assets.icons.geo.svg(
                      color: _selectedNavItem == 2
                          ? AppColors.darkBlue
                          : AppColors.grey5),
                  label: "Короче"),
              BottomNavigationBarItem(
                  icon: Assets.icons.notification.svg(
                      color: _selectedNavItem == 3
                          ? AppColors.darkBlue
                          : AppColors.grey5),
                  label: "Подписки"),
              BottomNavigationBarItem(
                  icon: Assets.icons.profile.svg(
                      color: _selectedNavItem == 4
                          ? AppColors.darkBlue
                          : AppColors.grey5),
                  label: "Профиль"),
            ],
          ),
        ),
      ),
    );
  }
}
