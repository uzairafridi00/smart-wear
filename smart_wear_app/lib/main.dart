import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:smart_wear/presentation/splash_and_animation_screen/splash_and_animation_screen.dart';

import 'package:smart_wear/routes/app_routes.dart';
import 'package:smart_wear/widgets/app_bar/bottom_navbar.dart';
import './presentation/home_screen/home_screen.dart';
import './presentation/sign_in_screen/sign_in_screen.dart';
import './core/utils/color_constant.dart';
import './providers/auth_provider.dart';

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
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(
          create: (_) => AuthProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthProvider>().authState,
          // context.read<AuthProvider>().authState
          // Shot form of
          // Provider.of(context, listen:false)
          initialData: null,
        ),
      ],
      child: MaterialApp(
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
        //initialRoute: AppRoutes.splashAndAnimationScreen,
        home: AuthWrapper(),
        routes: AppRoutes.routes,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    // context.watch
    // Short Form of
    // Provider.of(context)

    if (firebaseUser != null) {
      // return HomeScreen for logged in users
      return BottomNavBarWidget();
    } else {
      // return SignInScreen for not logged in users
      return SignInScreen(
        onSignedIn: () {
          // rebuild the UI when the user signs in
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You have successfully signed in.')),
          );
        },
      );
    }
  }
}
