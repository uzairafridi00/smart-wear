import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineGray60066 => BoxDecoration(
        color: ColorConstant.whiteA7007f,
        border: Border.all(
          color: ColorConstant.gray60066,
          width: getHorizontalSize(
            1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillRedA7007f => BoxDecoration(
        color: ColorConstant.redA7007f,
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1,
          ),
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      );
  static BoxDecoration get fillWhiteA700bf => BoxDecoration(
        color: ColorConstant.whiteA700Bf,
      );
  static BoxDecoration get outlineBlack90033 => BoxDecoration(
        color: ColorConstant.blueGray10019,
        border: Border.all(
          color: ColorConstant.black90033,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtFillAmber700 => BoxDecoration(
        color: ColorConstant.amber700,
      );
  static BoxDecoration get outlineBlack90026 => BoxDecoration(
        color: ColorConstant.blueGray10019,
        border: Border.all(
          color: ColorConstant.black90026,
          width: getHorizontalSize(
            1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillAmber700 => BoxDecoration(
        color: ColorConstant.amber700,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillBluegray10033 => BoxDecoration(
        color: ColorConstant.blueGray10033,
      );
  static BoxDecoration get fillBluegray1007f => BoxDecoration(
        color: ColorConstant.blueGray1007f,
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder77 = BorderRadius.circular(
    getHorizontalSize(
      77,
    ),
  );

  static BorderRadius circleBorder55 = BorderRadius.circular(
    getHorizontalSize(
      55,
    ),
  );

  static BorderRadius roundedBorder15 = BorderRadius.circular(
    getHorizontalSize(
      15,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius txtRoundedBorder15 = BorderRadius.circular(
    getHorizontalSize(
      15,
    ),
  );

  static BorderRadius circleBorder39 = BorderRadius.circular(
    getHorizontalSize(
      39,
    ),
  );

  static BorderRadius customBorderBL20 = BorderRadius.only(
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
  );
}
