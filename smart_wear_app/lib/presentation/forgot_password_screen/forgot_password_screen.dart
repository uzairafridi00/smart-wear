import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:smart_wear/core/app_export.dart';

import 'package:smart_wear/widgets/custom_button.dart';

import '../../providers/auth_provider.dart';
import '../../core/utils/my_show_dialogs.dart';
import '../sign_in_screen/sign_in_screen.dart';
// ignore_for_file: must_be_immutable

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _isLogin = true;

  void _submitForm() async {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    // Display a progress indicator while resetting the password
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: CircularProgressIndicator(),
      ),
    );

    final email = emailController.text.trim();
    try {
      await AuthProvider(FirebaseAuth.instance).resetPassword(email);
      Navigator.of(context).pop(); // Close the progress indicator
      _showResetSuccessDialog();
      emailController.clear();
    } catch (e) {
      Navigator.of(context).pop(); // Close the progress indicator
      _showResetErrorDialog(e.toString());
      emailController.clear();
    }
  }

  void _showResetSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => MyShowDialog.successDialog(
          context, 'Email Password reset link sent successfully.'),
    );
  }

  void _showResetErrorDialog(String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          MyShowDialog.errorDialog(context, error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.amber700,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text(
            "Forgot Password",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: size.width * 0.99,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(color: ColorConstant.black900),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: size.height * 0.26,
                    width: size.width * 0.72,
                    margin: EdgeInsets.only(
                        left: size.width * 0.1, top: size.height * 0.011),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: size.height * 0.15,
                            width: size.height * 0.15,
                            margin: EdgeInsets.only(top: size.height * 0.022),
                            decoration: BoxDecoration(
                              color: ColorConstant.blueGray100,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.075),
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgUndrawmypassw,
                          height: size.height * 0.262,
                          width: size.width * 0.67,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, top: size.height * 0.012),
                    child: Text(
                      "Forgot your Password?",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterBold30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                ),
                Container(
                  width: size.width * 0.9,
                  margin: EdgeInsets.fromLTRB(size.width * 0.05,
                      size.height * 0.02, size.width * 0.05, 0),
                  child: Text(
                    "Confirm or provide your email we will send you an otp and instructions.",
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInderRegular18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                ),
                Container(
                  width: size.width * 0.85,
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
                    ],
                  ),
                ),
                CustomButton(
                  height: size.height * 0.055,
                  text: "Reset Password",
                  margin: EdgeInsets.fromLTRB(size.width * 0.05,
                      size.height * 0.048, size.width * 0.055, 0),
                  onTap: _submitForm,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft5(BuildContext context) {
    Navigator.pop(context);
  }
}
