import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:smart_wear/core/app_export.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ref = FirebaseDatabase.instance.ref('User');
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
      body: SingleChildScrollView(child: StreamBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              width: screenWidth,
              height: screenHeight,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.25,
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.02),
                      child: Column(children: [
                        CircleAvatar(
                          radius: screenWidth * 0.1,
                          backgroundImage:
                              const AssetImage("assets/images/profile_pic.png"),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Test",
                          style: const TextStyle(
                              fontSize: 30, fontFamily: "gillsans"),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Edit Profile Picture ",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "gillsans",
                              color: activeColorIndicator),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: "gillsans",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Test",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 23,
                              fontFamily: "gillsans",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "test@test.com",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "gillsans",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "*********",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 40),
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
              ),
            );
          }
        },
      )),
    );
  }
}
