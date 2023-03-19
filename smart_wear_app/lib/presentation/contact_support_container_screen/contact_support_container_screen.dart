import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ContactSupportContainerScreen extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Text('Contact Support'),
    );
  }
}
