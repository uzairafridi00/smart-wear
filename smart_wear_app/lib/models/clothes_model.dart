import 'package:flutter/material.dart';

class Clothes {
  String? image;
  String? name;

  double? rate;
  Color? startColor;
  Color? endColor;

  Clothes({this.image, this.name, this.rate, this.startColor, this.endColor});
}

var destination = [
  Clothes(
    image: 'shirt.png',
    name: 'T-Shirts',
    rate: 4.7,
    startColor: const Color(0xFFF37552),
    endColor: const Color(0xFFF58B5A),
  ),
  Clothes(
    image: 'pant.png',
    name: 'Pants',
    rate: 4.9,
    startColor: const Color(0xFFF37552),
    endColor: const Color(0xFFF58B5A),
  ),
];
