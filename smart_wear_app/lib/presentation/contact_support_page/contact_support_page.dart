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
          title: const Text('Contact Support'),
        ),
        backgroundColor: ColorConstant.whiteA700,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage('assets/images/about_us.png'),
                ),
                SizedBox(height: 10), // Add some spacing between image and text
                SizedBox(
                  width: 300,
                  child: Center(
                    child: Text(
                      'If you face any issue, feel free to contact our support team.', // Replace with your desired text
                      style: TextStyle(
                        fontSize: 18, // Adjust the font size as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 300,
                  child: Center(
                    child: Text(
                      'info@smartwear.com', // Replace with your desired text
                      style: TextStyle(
                        fontSize: 18, // Adjust the font size as needed
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
