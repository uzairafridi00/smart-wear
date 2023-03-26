import 'package:flutter/material.dart';
import 'package:smart_wear/presentation/home_screen/list_view_item/list_view_item.dart';
import 'package:smart_wear/presentation/home_screen/page_view_clothes_list.dart';
import 'package:smart_wear/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:smart_wear/presentation/sign_up_with_email_screen/sign_up_with_email_screen.dart';
import 'package:smart_wear/presentation/home_screen/home_screen.dart';
import 'package:smart_wear/presentation/edit_profile_one_screen/edit_profile_one_screen.dart';
import 'package:smart_wear/presentation/about_us_screen/about_us_screen.dart';
import 'package:smart_wear/presentation/contact_support_container_screen/contact_support_container_screen.dart';
import 'package:smart_wear/presentation/edit_profile_screen/edit_profile_screen.dart';

import 'package:smart_wear/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:smart_wear/presentation/favorites_screen/favorites_screen.dart';
import 'package:smart_wear/presentation/shirt_description_screen/shirt_description_screen.dart';
import 'package:smart_wear/presentation/settings_screen/settings_screen.dart';

import '../presentation/dashboard/dashboard_screen.dart';

class AppRoutes {
  static const String dashboardScreen = '/dashboard';

  static const String introScreen = '/intro';

  static const String signInOneScreen = '/sign_in_screen';

  static const String signUpWithEmailScreen = '/sign_up_with_email_screen';

  static const String homeScreen = '/home_screen';

  static const String editProfileOneScreen = '/edit_profile_one_screen';

  static const String aboutUsScreen = '/about_us_screen';

  static const String contactSupportPage = '/contact_support_page';

  static const String contactSupportContainerScreen =
      '/contact_support_container_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String forgotPassword = '/forgot_password';

  static const String favoritesScreen = '/favorites_screen';

  static const String shirtDescriptionScreen = '/shirt_description_screen';

  static const String settingsScreen = '/settings_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String listViewItem = '/list_view_item';

  static Map<String, WidgetBuilder> routes = {
    dashboardScreen: (context) => DashboardScreen(),
    signInOneScreen: (context) => SignInScreen(),
    signUpWithEmailScreen: (context) => SignUpWithEmailScreen(),
    homeScreen: (context) => HomeScreen(),
    editProfileOneScreen: (context) => EditProfileOneScreen(),
    aboutUsScreen: (context) => AboutUsScreen(),
    contactSupportContainerScreen: (context) => ContactSupportContainerScreen(),
    editProfileScreen: (context) => EditProfileScreen(),
    forgotPassword: (context) => ForgotPasswordScreen(),
    favoritesScreen: (context) => FavoritesScreen(),
    shirtDescriptionScreen: (context) => ShirtDescriptionScreen(),
    settingsScreen: (context) => SettingsScreen(),
    listViewItem: (context) => ListViewItem(),
  };
}
