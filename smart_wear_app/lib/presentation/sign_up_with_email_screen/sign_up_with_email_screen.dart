import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// Local Imports
import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/presentation/home_screen/home_screen.dart';
import 'package:smart_wear/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:smart_wear/widgets/custom_button.dart';
import '../../routes/app_routes.dart';
import '../../controllers/auth_controller.dart';
import '../../core/utils/utils.dart';
// ignore_for_file: must_be_immutable

class SignUpWithEmailScreen extends StatefulWidget {
  SignUpWithEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignUpWithEmailScreen> createState() => _SignUpWithEmailScreenState();
}

class _SignUpWithEmailScreenState extends State<SignUpWithEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final emailFocusNode = FocusNode();
  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _isShowPassword = true;
  void _toggleShowPassword() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    userNameFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstant.amber700,
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: const Text(
              "SignUp",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          backgroundColor: ColorConstant.whiteA700,
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider(
            create: (_) => AuthController(),
            child: Consumer<AuthController>(
              builder: (context, provider, child) {
                return Form(
                  key: _formkey,
                  child: Container(
                    width: width * 0.99, // 99% of the screen width
                    padding: EdgeInsets.only(
                        left: width * 0.03,
                        top: height * 0.010,
                        right: width *
                            0.03), // top padding is 19.6% of screen height
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.022,
                                top: height *
                                    0.031), // top padding is 3.1% of screen height
                            child: Text(
                              "Sign Up With Email",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterBold30,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: height *
                                0.024), // height is 2.4% of screen height
                        Container(
                          width: width * 0.85,
                          child: Column(
                            children: [
                              TextFormField(
                                key: const ValueKey('email'),
                                focusNode: emailFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'Please Enter a Valid Email Address';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    labelText: 'Email Address'),
                                controller: emailController,
                                onFieldSubmitted: (value) {
                                  Utils.fieldFocus(context, emailFocusNode,
                                      userNameFocusNode);
                                },
                              ),
                              TextFormField(
                                key: const ValueKey('username'),
                                focusNode: userNameFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter a username';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    labelText: 'UserName'),
                                controller: userNameController,
                                onFieldSubmitted: (value) {
                                  Utils.fieldFocus(context, userNameFocusNode,
                                      passwordFocusNode);
                                },
                              ),
                              TextFormField(
                                key: const ValueKey('password'),
                                focusNode: passwordFocusNode,
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
                        Padding(
                          padding: getPadding(left: 6, top: 10),
                          child: Text("Combine upper and lower case letters.",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInderRegular17Black900),
                        ),

                        provider.isLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                height: getVerticalSize(55),
                                text: "Sign Up",
                                margin: getMargin(left: 6, top: 33, right: 11),
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    provider.signup(
                                        context,
                                        userNameController.text,
                                        emailController.text,
                                        passwordController.text);
                                  }
                                },
                              ),
                        Padding(
                          padding: getPadding(left: 6, top: 26, bottom: 5),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "By joining you agree to SWA app",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(17),
                                  fontFamily: 'Inder',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: " Terms of Services",
                                style: TextStyle(
                                  color: ColorConstant.amber700,
                                  fontSize: getFontSize(17),
                                  fontFamily: 'Inder',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: ".",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(17),
                                  fontFamily: 'Inder',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }

  onTapSignup(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInOneScreen);
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
