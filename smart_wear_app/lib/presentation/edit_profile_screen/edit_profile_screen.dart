import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/presentation/contact_support_page/contact_support_page.dart';

import 'package:smart_wear/widgets/custom_bottom_bar.dart';
import 'package:smart_wear/widgets/custom_button.dart';
import 'package:smart_wear/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/bottom_navbar.dart';
import '../../widgets/side_drawer_widget.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: Text('Edit Profile'),
    );
  }
}
