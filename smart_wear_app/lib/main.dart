import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:smart_wear/presentation/splash_screen/splash_screen.dart';
import './presentation/dashboard/dashboard_screen.dart';

import 'package:smart_wear/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        //canvasColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
          errorColor: Colors.redAccent,
        ).copyWith(secondary: Color.fromARGB(255, 254, 209, 46)),
      ),
      title: 'smart_wear',
      debugShowCheckedModeBanner: false,
      //home: DashboardScreen(),
      home: SplashScreen(),
      routes: AppRoutes.routes,
    );
  }
}
