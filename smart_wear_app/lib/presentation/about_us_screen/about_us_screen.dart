import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: const Text('About Us'),
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/images/about_us.png'),
            ),
            const SizedBox(
                height: 10), // Add some spacing between image and text
            const SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  'Our mission is to create an AR Smart Wear app that enables customers to virtually try on clothes, providing a seamless environment for testing different outfits.', // Replace with your desired text
                  style: TextStyle(
                    fontSize: 16, // Adjust the font size as needed
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 40), // Add some spacing between image and text
            const SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  'Smart Wear enables users to try on clothes without physically touching them, so they can check the size, style, and fit of the product (clothes) they are buying.', // Replace with your desired text
                  style: TextStyle(
                    fontSize: 16, // Adjust the font size as needed
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 60), // Add some spacing between image and text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SocialIconButton(
                  iconPath: 'assets/images/facebook.png',
                  link:
                      'https://www.facebook.com/', // Replace with your Facebook page link
                ),
                SocialIconButton(
                  iconPath: 'assets/images/instagram.png',
                  link:
                      'https://www.instagram.com/', // Replace with your Instagram page link
                ),
                SocialIconButton(
                  iconPath: 'assets/images/linkedin.png',
                  link:
                      'https://www.linkedin.com/', // Replace with your LinkedIn page link
                ),
              ],
            ),
            const SizedBox(
                height: 60), // Add some spacing between image and text
            const SizedBox(
              width: 300,
              child: Center(
                child: Text('© 2023 All Rights Reserved'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIconButton extends StatelessWidget {
  final String iconPath;
  final String link;

  const SocialIconButton(
      {super.key, required this.iconPath, required this.link});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _launchURL(),
      icon:
          Image.asset(iconPath, width: 40, height: 40), // Adjust size as needed
    );
  }

  void _launchURL() async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
