import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

import 'package:smart_wear/controllers/profile_controller.dart';
import 'package:smart_wear/core/app_export.dart';
import '../../controllers/session_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Firebase User instance
  final ref = FirebaseDatabase.instance.ref('Users');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.navigate_before,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        }),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child) {
            return Container(
              width: screenWidth,
              height: screenHeight,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02),
              child: StreamBuilder(
                stream:
                    ref.child(SessionController().userId.toString()).onValue,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data?.snapshot?.value != null) {
                    Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: screenHeight * 0.25,
                          child: SafeArea(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.02),
                              child: Column(children: [
                                // Place the image on Full Screen
                                FullScreenWidget(
                                  child: Container(
                                    width: screenWidth * 0.23,
                                    height: screenHeight * 0.1,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ColorConstant.amber300,
                                        width: 5,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 0.1),
                                      child: provider.image == null
                                          ? map['profile'].toString() == ""
                                              ? const Icon(
                                                  Icons.person,
                                                  size: 40,
                                                )
                                              : Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    map['profile'].toString(),
                                                  ),
                                                  loadingBuilder: (context,
                                                      child, loadingprogress) {
                                                    if (loadingprogress == null)
                                                      return child;
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator
                                                              .adaptive(),
                                                    );
                                                  },
                                                  errorBuilder:
                                                      (context, object, stack) {
                                                    return Container(
                                                      child: Icon(
                                                        Icons.error_outline,
                                                        color: ColorConstant
                                                            .redA700E5,
                                                      ),
                                                    );
                                                  },
                                                )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                    File(provider.image!.path)
                                                        .absolute),
                                                const Center(
                                                  child:
                                                      CircularProgressIndicator
                                                          .adaptive(),
                                                )
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${map['userName']}",
                                  style: const TextStyle(
                                      fontSize: 30, fontFamily: "gillsans"),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.pickImage(context);
                                  },
                                  child: const Text(
                                    "Edit Profile Picture ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "gillsans",
                                        color: activeColorIndicator),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  provider.showUserNameDialogAlert(
                                      context, map['userName']);
                                },
                                child: ResuableRow(
                                  title: "Username",
                                  value: "${map['userName']}",
                                  iconData: Icons.person,
                                ),
                              ),
                              ResuableRow(
                                title: "Email",
                                value: "${map['email']}",
                                iconData: Icons.email,
                              ),
                              GestureDetector(
                                onTap: () {
                                  provider.showPhoneDialogAlert(
                                    context,
                                    map['phone'].toString(),
                                  );
                                },
                                child: map['phone'] == null
                                    ? const ResuableRow(
                                        title: "Phone",
                                        value: "000000000",
                                        iconData: Icons.phone,
                                      )
                                    : ResuableRow(
                                        title: "Phone",
                                        value: "${map['phone']}",
                                        iconData: Icons.phone,
                                      ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(left: 30, right: 30, bottom: 40),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorConstant.amber700,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'switzer',
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ResuableRow extends StatelessWidget {
  final String title, value;
  final IconData iconData;
  const ResuableRow(
      {Key? key,
      required this.title,
      required this.value,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: Icon(iconData),
          trailing: Text(value),
        ),
        Divider(color: ColorConstant.black900.withOpacity(0.4))
      ],
    );
  }
}
