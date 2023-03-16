import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/presentation/contact_support_page/contact_support_page.dart';
import 'package:smart_wear/widgets/app_bar/bottom_navbar.dart';

import 'package:smart_wear/widgets/custom_bottom_bar.dart';
import 'package:smart_wear/widgets/custom_icon_button.dart';

import '../../main.dart';
import '../../providers/auth_provider.dart';
import '../sign_in_screen/sign_in_screen.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  var _isSigningOut = false;
  void _tryLogout() async {
    setState(() {
      _isSigningOut = true;
    });
    await AuthProvider(FirebaseAuth.instance).signOut();
    await AuthProvider(FirebaseAuth.instance).signOutFromGoogle();
    await AuthProvider(FirebaseAuth.instance).signOutFromFirebase();

    // Return to the previous screen (which should be the sign-in screen)
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();

    setState(() {
      _isSigningOut = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        backgroundColor: ColorConstant.whiteA700,
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
