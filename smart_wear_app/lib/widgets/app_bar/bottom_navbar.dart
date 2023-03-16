import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:smart_wear/presentation/about_us_screen/about_us_screen.dart';
import 'package:smart_wear/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:smart_wear/presentation/favorites_screen/favorites_screen.dart';
import 'package:smart_wear/presentation/home_screen/home_screen.dart';
import 'package:smart_wear/presentation/settings_screen/settings_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    EditProfileScreen(),
    AboutUsScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  final List<GButton> _screens = [
    GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    GButton(
      icon: Icons.person,
      text: 'User',
    ),
    GButton(
      icon: Icons.remove_red_eye_outlined,
      text: 'AR',
    ),
    GButton(
      icon: Icons.favorite_border,
      text: 'Likes',
    ),
    GButton(
      icon: Icons.settings,
      text: 'Settings',
    ),
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) => _screens[_selectedIndex],
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            duration: const Duration(milliseconds: 400),
            gap: 4,
            selectedIndex: _selectedIndex,
            onTabChange: _onTabChange,
            padding: EdgeInsets.all(16),
            tabs: _screens,
          ),
        ),
      ),
    );
  }
}

// class BottomNavWidget extends StatefulWidget {
//   @override
//   _BottomNavWidgetState createState() => _BottomNavWidgetState();
// }

// class _BottomNavWidgetState extends State<BottomNavWidget> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     HomeScreen(),
//     EditProfileScreen(),
//     AboutUsScreen(),
//     FavoritesScreen(),
//     SettingsScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Navigator(
//         onGenerateRoute: (settings) {
//           return MaterialPageRoute(
//             builder: (_) => _screens[_selectedIndex],
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.remove_red_eye_outlined), label: 'Eye'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite_border_outlined), label: 'Favorites'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
