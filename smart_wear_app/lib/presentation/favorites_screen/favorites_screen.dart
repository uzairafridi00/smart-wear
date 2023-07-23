import 'package:flutter_svg/svg.dart';

import '../../widgets/app_bar/bottom_navbar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 18, left: 2),
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * .35,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Smart Wear",
                        style: TextStyle(
                            fontFamily: "geometric",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
