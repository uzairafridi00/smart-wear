import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_wear/core/app_export.dart';

import '../../../core/utils/color_constant.dart';
import '../../home_screen/home_screen.dart';
import '../../sign_in_screen/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds before navigating to the main app
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Navigate to the appropriate screen based on authentication status
        final firebaseUser = context.read<User?>();
        // context.read
        // Short Form of
        // Provider.of(context)
        if (firebaseUser != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(
                onSignedIn: () {
                  // rebuild the UI when the user signs in
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You have successfully signed in.'),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.amber700,
      body: const Center(
        child: Text(
          "Smart Wear",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'geometric',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
