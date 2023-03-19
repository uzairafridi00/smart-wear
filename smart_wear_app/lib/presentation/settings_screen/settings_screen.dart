import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Screens
import 'package:smart_wear/presentation/about_us_screen/about_us_screen.dart';
import 'package:smart_wear/presentation/contact_support_page/contact_support_page.dart';
import 'package:smart_wear/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:smart_wear/presentation/favorites_screen/favorites_screen.dart';
import 'package:smart_wear/presentation/home_screen/home_screen.dart';
import 'package:smart_wear/presentation/settings_screen/settings_screen.dart';

import '../../providers/auth_provider.dart';
import 'package:smart_wear/core/utils/color_constant.dart';
import 'package:smart_wear/widgets/app_bar/bottom_navbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _isSigningOut = false;
  void _tryLogout() async {
    setState(() {
      _isSigningOut = true;
    });
    try {
      await AuthProvider(FirebaseAuth.instance).signOut();
      await AuthProvider(FirebaseAuth.instance).signOutFromGoogle();
      await AuthProvider(FirebaseAuth.instance).signOutFromFirebase();
    } catch (e) {
      // Handle any errors that occur during sign out
      debugPrint('Error signing out');
    }

    // Return to the previous screen (which should be the sign-in screen)
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();

    setState(() {
      _isSigningOut = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isSigningOut
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text('John Doe'),
                  accountEmail: const Text('johndoe@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.png'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Settings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Edit Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline_rounded),
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_support_outlined),
                  title: const Text('Contact Support'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactSupportScreen()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Logout'),
                  onTap: _tryLogout,
                ),
              ],
            ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(26, 189, 189, 189),
            borderRadius: BorderRadius.circular(40)),
        child: BottomNavbarWidget(),
      ),
    );
  }
}
