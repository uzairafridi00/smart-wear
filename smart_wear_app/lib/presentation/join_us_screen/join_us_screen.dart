import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' as fs;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/presentation/home_screen/home_screen.dart';

import '../../providers/auth_provider.dart';

class JoinUsScreen extends StatefulWidget {
  @override
  State<JoinUsScreen> createState() => _JoinUsScreenState();
}

class _JoinUsScreenState extends State<JoinUsScreen> {
  var _isLoading = false;
  void _tryLoginWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await AuthProvider(FirebaseAuth.instance).signInWithGoogle();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (error) {
      return;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorConstant.amber700,
              iconTheme: const IconThemeData(
                color: Colors.white, //change your color here
              ),
              title: const Text(
                "Join Us",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 44, bottom: 44),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        child: Container(
                          width: double.maxFinite,
                          padding: getPadding(
                              left: 15, top: 12, right: 15, bottom: 12),
                          decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   // image: fs.Svg(ImageConstant.imgGroup10),
                              //   image: fs.SvgPicture(ImageConstant.imgGroup10
                              //       as fs.BytesLoader) as ImageProvider,
                              //   fit: BoxFit.cover,
                              // ),
                              ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowleft,
                                height: getVerticalSize(17),
                                width: getHorizontalSize(30),
                                margin: getMargin(bottom: 12),
                                onTap: () {
                                  onTapImgArrowleft(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: getVerticalSize(184),
                        width: getHorizontalSize(203),
                        margin: getMargin(left: 89),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: getSize(150),
                                width: getSize(150),
                                decoration: BoxDecoration(
                                  color: ColorConstant.blueGray100,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(75),
                                  ),
                                ),
                              ),
                            ),
                            CustomImageView(
                                imagePath: ImageConstant.imgUndrawjoinre,
                                height: getVerticalSize(183),
                                width: getHorizontalSize(200),
                                alignment: Alignment.center)
                          ],
                        ),
                      ),
                      Padding(
                          padding: getPadding(left: 10, top: 47),
                          child: Text("Join Us !",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterBold30)),
                      Container(
                        width: getHorizontalSize(396),
                        margin: getMargin(left: 10, top: 7, right: 23),
                        child: Text(
                            "Join us so whenever you will sign in the app ypu will be \npick up where you exactly left off. ",
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInderRegular15),
                      ),
                      _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : GestureDetector(
                              onTap: _tryLoginWithGoogle,
                              child: Container(
                                margin: getMargin(left: 10, top: 84, right: 10),
                                padding: getPadding(
                                    left: 78, top: 8, right: 78, bottom: 8),
                                decoration: AppDecoration.fillBluegray1007f
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(MdiIcons.google),
                                    Padding(
                                      padding: getPadding(top: 13, bottom: 2),
                                      child: Text(
                                        "Continue with Google",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInderRegular20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      GestureDetector(
                        onTap: () {
                          onTapRowenvelopeone(context);
                        },
                        child: Container(
                          margin: getMargin(left: 10, top: 41, right: 10),
                          padding: getPadding(
                              left: 86, top: 12, right: 86, bottom: 12),
                          decoration: AppDecoration.fillBluegray1007f.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(MdiIcons.email),
                              Padding(
                                  padding: getPadding(left: 10, top: 7),
                                  child: Text("Continue with Email",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInderRegular20))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: getPadding(left: 9, top: 34),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "By joining you agree to SWA app",
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(17),
                                        fontFamily: 'Inder',
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: " Terms of Services",
                                    style: TextStyle(
                                        color: ColorConstant.amber700,
                                        fontSize: getFontSize(17),
                                        fontFamily: 'Inder',
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: ".",
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(17),
                                        fontFamily: 'Inder',
                                        fontWeight: FontWeight.w400))
                              ]),
                              textAlign: TextAlign.left)),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            onTapTxtSignIn(context);
                          },
                          child: Padding(
                              padding: getPadding(left: 39, bottom: 19),
                              child: Text("Sign In",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInderRegular22)))
                    ]))));
  }

  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  onTapRowenvelopeone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpWithEmailScreen);
  }

  onTapTxtSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInOneScreen);
  }
}
