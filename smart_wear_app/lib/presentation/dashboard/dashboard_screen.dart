import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:smart_wear/presentation/favorites_screen/favorites_screen.dart';
import 'package:smart_wear/presentation/home_screen/home_screen.dart';
import 'package:smart_wear/presentation/settings_screen/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    List<Widget> screens = [
      HomeScreen(),
      EditProfileScreen(),
      EditProfileScreen(),
      FavoritesScreen(),
      SettingsScreen(),
    ];
    // debugPrint('_buildScreen: ${screens.length} screens found');
    return screens;
  }

  List<PersistentBottomNavBarItem> _navbarItems() {
    List<PersistentBottomNavBarItem> items = [
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.home,
          size: 28,
        ), // set the size of the icon to 30
        activeColorPrimary: CupertinoColors.activeOrange,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.person,
          size: 28,
        ), // set the size of the icon to 30
        activeColorPrimary: CupertinoColors.activeOrange,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.eye,
          size: 28,
        ), // set the size of the icon to 30
        activeColorPrimary: CupertinoColors.activeOrange,
        activeColorSecondary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.heart,
          size: 28,
        ), // set the size of the icon to 30
        activeColorPrimary: CupertinoColors.activeOrange,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.settings,
          size: 28,
        ), // set the size of the icon to 30
        activeColorPrimary: CupertinoColors.activeOrange,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
    // debugPrint('_navbarItems: ${items.length} items found');
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navbarItems(),
      controller: _controller,
      confineInSafeArea: true,
      backgroundColor: Colors.white54,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white54,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
