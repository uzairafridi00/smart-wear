import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/presentation/contact_support_page/contact_support_page.dart';
import 'package:smart_wear/widgets/custom_bottom_bar.dart';

import '../../widgets/app_bar/bottom_navbar.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        backgroundColor: ColorConstant.whiteA700,
        body: Text('Settings'),
      ),
    );
  }
}
