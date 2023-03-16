import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/widgets/custom_button.dart';
import 'package:smart_wear/widgets/custom_text_form_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../providers/auth_provider.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignInScreen extends StatefulWidget {
  final VoidCallback? onSignedIn;

  SignInScreen({super.key, this.onSignedIn});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  var _isLogin = true;

  bool _isShowPassword = true;
  void _toggleShowPassword() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  var _isLoading = false;

  void _trySubmit() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formkey.currentState!.save();

      setState(() {
        _isLoading = true;
      });

      try {
        await AuthProvider(FirebaseAuth.instance).loginWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
        // call the onSignedIn callback when the user signs in
        widget.onSignedIn?.call();
      } on String catch (errorMsg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMsg)),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _tryLoginWithGoogle() async {
    try {
      await context.read<AuthProvider>().signInWithGoogle();

      // call the onSignedIn callback when the user signs in
      widget.onSignedIn?.call();
    } on String catch (errorMsg) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Container(
            width: screenWidth,
            height: screenHeight,
            padding: getPadding(
              top: 45,
              bottom: 45,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgUndrawhappyan,
                  height: screenHeight * 0.22,
                  width: screenWidth * 0.7,
                  margin: getMargin(top: 16),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(left: 15, top: 14),
                    child: Text(
                      "Welcome back",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterBold30,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: getHorizontalSize(346),
                    margin: getMargin(left: 31, top: 14, right: 52),
                    child: Text(
                      "Sign in to app to pick up exactly where you left off.",
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInderRegular17,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.06,
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton.icon(
                            icon: const Image(
                              image:
                                  AssetImage('assets/images/google-logo.png'),
                              width: 50,
                              height: 50,
                            ),
                            label: const Text('Continue'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors
                                      .white70), // set the background color to red
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                  TextStyle(
                                      color: Colors
                                          .white)), // set the text color to white
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical:
                                          8)), // set the padding of the button
                            ),
                            onPressed: _tryLoginWithGoogle,
                          ),
                  ),
                ),
                Padding(
                    padding: getPadding(top: 22),
                    child: Text(" or sign in  with email",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInderRegular19)),
                Container(
                  width: screenWidth * 0.85,
                  child: Column(
                    children: [
                      TextFormField(
                        key: const ValueKey('email'),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please Enter a Valid Email Address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            const InputDecoration(labelText: 'Email Address'),
                        controller: emailController,
                      ),
                      TextFormField(
                        key: const ValueKey('password'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return "Password must be atleast 8 characters long";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isShowPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              _toggleShowPassword();
                            },
                          ),
                        ),
                        obscureText: _isShowPassword,
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
                _isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        height: getVerticalSize(55),
                        text: "Continue",
                        margin: getMargin(left: 6, top: 33, right: 11),
                        onTap: _trySubmit,
                      ),
                Padding(
                  padding: getPadding(left: 35, top: 45, right: 18, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onTapTxtJoin(context);
                        },
                        child: Padding(
                          padding: getPadding(bottom: 1),
                          child: Text("Join",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInderRegular22),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          onTapTxtForgotPassword(context);
                        },
                        child: Padding(
                          padding: getPadding(top: 1),
                          child: Text("Forgot Password",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInderRegular22),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // onTapContinue(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.homeScreen);
  // }

  onTapTxtJoin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpWithEmailScreen);
  }

  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }
}
