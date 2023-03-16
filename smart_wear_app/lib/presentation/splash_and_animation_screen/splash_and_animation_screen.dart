import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/widgets/custom_button.dart';

class SplashAndAnimationScreen extends StatelessWidget {
  const SplashAndAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.amber300,
        body: Center(
          child: Container(
            width: screenWidth,
            padding: getPadding(
              left: screenWidth * 0.02,
              right: screenWidth * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * 0.67,
                  width: screenWidth,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: getPadding(bottom: screenHeight * 0.03),
                          child: Text(
                            "Smart Wear App",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInderRegular30,
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgSwalogoremovebgpreview,
                        height: screenHeight * 0.25,
                        width: screenWidth,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.033,
                ),
                CustomButton(
                  height: screenHeight * 0.070,
                  text: "Get Started",
                  margin: getMargin(
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1,
                  ),
                  fontStyle: ButtonFontStyle.InderRegular24,
                  onTap: () => onTapGetstarted(context),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Text(
                  "© 2023 All Rights Reserved By DevMaze",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInderRegular20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapGetstarted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInOneScreen);
  }
}
