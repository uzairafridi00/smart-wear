import 'package:flutter/material.dart';
import 'package:smart_wear/core/utils/color_constant.dart';

import './splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashService = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.amber300,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/icon.png'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'Smart Wear',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
