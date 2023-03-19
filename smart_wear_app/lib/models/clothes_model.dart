import 'package:flutter/material.dart';

class Clothes {
  String? image;
  String? name;
  String? location;
  double? rate;
  Color? startColor;
  Color? endColor;

  Clothes(
      {this.image,
      this.name,
      this.location,
      this.rate,
      this.startColor,
      this.endColor});
}

var destination = [
  Clothes(
    image: 'mainp1.png',
    name: 'Niladri Reservoir',
    location: 'Tekergat , Sunamgnj',
    rate: 4.7,
    startColor: const Color(0xFFF37552),
    endColor: const Color(0xFFF58B5A),
  ),
  Clothes(
    image: 'mainp2.png',
    name: 'Darma Reservoir',
    location: 'Darma, Kuningan',
    rate: 4.9,
    startColor: const Color(0xFFF37552),
    endColor: const Color(0xFFF58B5A),
  ),
  Clothes(
    image: 'mainp3.png',
    name: 'Niladri Reservoir',
    location: 'Tekergat , Sunamgnj',
    rate: 4.7,
    startColor: const Color(0xFFF37552),
    endColor: const Color(0xFFF58B5A),
  )
];
