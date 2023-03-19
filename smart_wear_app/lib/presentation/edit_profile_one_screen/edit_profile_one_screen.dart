import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/presentation/contact_support_page/contact_support_page.dart';

import 'package:smart_wear/widgets/custom_bottom_bar.dart';
import 'package:smart_wear/widgets/custom_button.dart';
import 'package:smart_wear/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/bottom_navbar.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class EditProfileOneScreen extends StatelessWidget {
  TextEditingController groupFifteenController = TextEditingController();

  TextEditingController groupSixteenController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(left: 14, top: 33, right: 14, bottom: 33),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: getVerticalSize(161),
                  width: getHorizontalSize(152),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgEllipse3,
                          height: getVerticalSize(154),
                          width: getHorizontalSize(152),
                          radius: BorderRadius.circular(
                            getHorizontalSize(77),
                          ),
                          alignment: Alignment.topCenter),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: getSize(40),
                          width: getSize(40),
                          margin: getMargin(right: 12),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgClose,
                                  height: getSize(40),
                                  width: getSize(40),
                                  alignment: Alignment.center),
                              CustomImageView(
                                  imagePath: ImageConstant.imgCameraaa1,
                                  height: getSize(30),
                                  width: getSize(30),
                                  alignment: Alignment.topCenter,
                                  margin: getMargin(top: 3))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: groupFifteenController,
                  hintText: "Username",
                  margin: getMargin(top: 25),
                ),
                CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: groupSixteenController,
                    hintText: "Email",
                    margin: getMargin(top: 43),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress),
                Container(
                  margin: getMargin(left: 2, top: 43),
                  padding: getPadding(left: 20, top: 11, right: 20, bottom: 11),
                  decoration: AppDecoration.fillBluegray1007f.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(left: 3, top: 5, bottom: 2),
                        child: Text(
                          "Password",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInderRegular20,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgEye1,
                        height: getVerticalSize(32),
                        width: getHorizontalSize(31),
                        margin: getMargin(top: 1),
                      )
                    ],
                  ),
                ),
                CustomButton(
                  height: getVerticalSize(55),
                  text: "Update Profie",
                  margin: getMargin(
                    top: 66,
                    bottom: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home1:
        return AppRoutes.contactSupportPage;
      case BottomBarEnum.User1:
        return "/";
      case BottomBarEnum.Eye1:
        return "/";
      case BottomBarEnum.Group3:
        return "/";
      case BottomBarEnum.Setting1:
        return "/";
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.contactSupportPage:
        return ContactSupportScreen();
      default:
        return DefaultWidget();
    }
  }

  onTapArrowleft1(BuildContext context) {
    Navigator.pop(context);
  }
}
