import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:smart_wear/presentation/about_us_screen/about_us_screen.dart';
import 'package:smart_wear/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:smart_wear/presentation/favorites_screen/favorites_screen.dart';
import 'package:smart_wear/presentation/home_screen/home_screen.dart';
import 'package:smart_wear/presentation/settings_screen/settings_screen.dart';

import '../../core/constants/constants.dart';
import '../../core/route/scale_route.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          ScaleRoute(
            page: HomeScreen(),
          ),
        );
      } else if (_selectedIndex == 1) {
        Navigator.push(
          context,
          ScaleRoute(
            // AR Screen Replaced here
            page: EditProfileScreen(),
          ),
        );
      } else if (_selectedIndex == 2) {
        Navigator.push(
          context,
          ScaleRoute(
            page: FavoritesScreen(),
          ),
        );
      } else if (_selectedIndex == 3) {
        Navigator.push(
          context,
          ScaleRoute(
            // AR Screen Replaced here
            page: SettingsScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset(
                    'assets/svg/Home.svg',
                    color: activeColorIndicator,
                  )
                : SvgPicture.asset(
                    'assets/svg/Home.svg',
                    color: Colors.black,
                  ),
            label: 'Home',
            tooltip: 'Home'),
        BottomNavigationBarItem(
          icon: _selectedIndex == 1
              ? SvgPicture.asset(
                  'assets/svg/AR.svg',
                  color: activeColorIndicator,
                )
              : SvgPicture.asset(
                  'assets/svg/AR.svg',
                ),
          label: 'AR',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 2
              ? SvgPicture.asset(
                  'assets/svg/Heart.svg',
                  color: activeColorIndicator,
                )
              : SvgPicture.asset(
                  'assets/svg/Heart.svg',
                ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 3
              ? SvgPicture.asset(
                  'assets/svg/Settings.svg',
                  color: activeColorIndicator,
                )
              : SvgPicture.asset(
                  'assets/svg/Settings.svg',
                ),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFFF6925C),
      onTap: _onItemTapped,
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }
}
