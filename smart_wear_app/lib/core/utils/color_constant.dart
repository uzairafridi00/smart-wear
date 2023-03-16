import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#808080');

  static Color whiteA7007f = fromHex('#7fffffff');

  static Color gray60066 = fromHex('#66808080');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color blueGray10033 = fromHex('#33d9d9d9');

  static Color amber300 = fromHex('#FFE9BF');

  static Color amber700 = fromHex('#ffa500');

  static Color black9003f = fromHex('#3f000000');

  static Color redA700E5 = fromHex('#e5ff0000');

  static Color blueGray10019 = fromHex('#19d9d9d9');

  static Color redA7007f = fromHex('#7fff0000');

  static Color black90033 = fromHex('#33000000');

  static Color black900Cc = fromHex('#cc000000');

  static Color black900 = fromHex('#000000');

  static Color blueGray1007f = fromHex('#7fd9d9d9');

  static Color blueGray1004c = fromHex('#4cd9d9d9');

  static Color whiteA700Bf = fromHex('#bfffffff');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black90026 = fromHex('#26000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
