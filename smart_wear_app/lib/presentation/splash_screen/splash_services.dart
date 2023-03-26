import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../controllers/session_controller.dart';
import '../../routes/app_routes.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      SessionController().userId = user.uid.toString();
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamed(
          context,
          AppRoutes.dashboardScreen,
        ),
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(
          context,
          AppRoutes.signInOneScreen,
        ),
      );
    }
  }
}
