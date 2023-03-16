import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';

// ignore: must_be_immutable
class ListellipsesevenItemWidget extends StatelessWidget {
  ListellipsesevenItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse7,
          height: getVerticalSize(
            75,
          ),
          width: getHorizontalSize(
            78,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              39,
            ),
          ),
          margin: getMargin(
            bottom: 9,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                right: 9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Muhamad Shaheer",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterBold20,
                  ),
                  Padding(
                    padding: getPadding(
                      left: 86,
                      bottom: 4,
                    ),
                    child: Text(
                      "21:30",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInderRegular16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: getHorizontalSize(
                320,
              ),
              margin: getMargin(
                top: 6,
              ),
              child: Text(
                "Our mission is to Text messaging, or texting",
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtInderRegular20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
