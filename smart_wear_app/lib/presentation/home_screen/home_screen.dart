import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_wear/controllers/profile_controller.dart';

import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/widgets/app_bar/bottom_navbar.dart';

import '../../controllers/session_controller.dart';
import './page_view_clothes_list.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ref = FirebaseDatabase.instance.ref('Users');
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (_) => ProfileController(),
      child: Consumer<ProfileController>(
        builder: (context, provider, child) {
          return StreamBuilder(
            stream: ref.child(SessionController().userId.toString()).onValue,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasData &&
                  snapshot.data?.snapshot.value != null) {
                Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 15, right: 20),
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
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Explore the\n',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'SFdisplay',
                                          fontSize: 40)),
                                  TextSpan(
                                      text: 'Beautiful ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'geometric',
                                          fontSize: 40)),
                                  TextSpan(
                                    text: 'Fashion\n',
                                    style: TextStyle(
                                      color: Color(0xffFF7029),
                                      fontFamily: 'geometric',
                                      fontSize: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 40,
                              top: 95,
                              child:
                                  SvgPicture.asset('assets/images/Vector.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Choose",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PageViewClothesList(),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          );
        },
      ),
    ));
  }
}
