import '../../widgets/app_bar/bottom_navbar.dart';
import '../../widgets/side_drawer_widget.dart';
import '../contact_support_page/widget/listellipseseven_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';

import 'package:smart_wear/widgets/custom_button.dart';

class ContactSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact Support'),
        ),
        backgroundColor: ColorConstant.whiteA700,
        body: Center(
          child: Text('Contact Support'),
        ),
      ),
    );
  }
}
