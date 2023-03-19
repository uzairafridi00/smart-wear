import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';

import '../../widgets/app_bar/bottom_navbar.dart';
import '../../widgets/side_drawer_widget.dart';

// ignore_for_file: must_be_immutable
class AboutUsScreen extends StatefulWidget {
  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: Text('About Us'),
    );
  }
}
