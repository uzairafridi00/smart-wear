import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';

// ignore: must_be_immutable
class FavoritesItemWidget extends StatelessWidget {
  FavoritesItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineGray60066.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: getMargin(
              left: 15,
              top: 20,
              bottom: 16,
            ),
            color: ColorConstant.blueGray10019,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: ColorConstant.black90033,
                width: getHorizontalSize(
                  1,
                ),
              ),
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  55,
                ),
              ),
            ),
            child: Container(
              height: getSize(
                110,
              ),
              width: getSize(
                110,
              ),
              padding: getPadding(
                left: 19,
                top: 9,
                right: 19,
                bottom: 9,
              ),
              decoration: AppDecoration.outlineBlack90033.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder55,
              ),
              child: Stack(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img611v84mopl1,
                    height: getVerticalSize(
                      88,
                    ),
                    width: getHorizontalSize(
                      70,
                    ),
                    alignment: Alignment.topCenter,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              bottom: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 21,
                      ),
                      child: Text(
                        "Trouser Pant",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInderRegular20,
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: getMargin(
                        left: 55,
                        bottom: 13,
                      ),
                      color: ColorConstant.amber700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            getHorizontalSize(
                              20,
                            ),
                          ),
                          bottomLeft: Radius.circular(
                            getHorizontalSize(
                              20,
                            ),
                          ),
                        ),
                      ),
                      child: Container(
                        height: getVerticalSize(
                          33,
                        ),
                        width: getHorizontalSize(
                          67,
                        ),
                        padding: getPadding(
                          left: 18,
                          right: 18,
                        ),
                        decoration: AppDecoration.fillAmber700.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderBL20,
                        ),
                        child: Stack(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgRemove1,
                              height: getSize(
                                30,
                              ),
                              width: getSize(
                                30,
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: getHorizontalSize(
                    213,
                  ),
                  margin: getMargin(
                    top: 10,
                  ),
                  child: Text(
                    "Our mission is to Text messaging, or texting, is the act of composing and",
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInderRegular16,
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
