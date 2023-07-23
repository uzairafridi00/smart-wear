import 'package:flutter/material.dart';

class Clothes {
  String? image;
  String? name;
  String? des;
  double? rate;
  bool? isFavorite;
  Color? startColor;
  Color? endColor;

  Clothes(
      {this.image,
      this.name,
      this.des,
      this.rate,
      this.isFavorite,
      this.startColor,
      this.endColor});
}

var destination = [
  Clothes(
    image: 'shirt.png',
    name: 'Red TShirt',
    des:
        'Stand out in style with our vibrant red tee, a classic piece that adds a bold touch to any outfit.',
    rate: 4.7,
    isFavorite: false,
    startColor: Color.fromARGB(255, 246, 179, 161),
    endColor: Color.fromARGB(255, 237, 183, 158),
  ),
  Clothes(
    image: 'orange-crew-tshirt.png',
    name: 'Orange Crew TShirt',
    des:
        'Embrace the warmth of summer with this cozy orange crew-neck tee, perfect for casual days in the sun.',
    rate: 4.7,
    isFavorite: false,
    startColor: Color.fromARGB(255, 246, 179, 161),
    endColor: Color.fromARGB(255, 237, 183, 158),
  ),
  Clothes(
    image: 'navy-crew-tshirt.png',
    name: 'Navy Crew TShirt',
    des:
        'Stay effortlessly cool in our navy blue crew-neck tee, a timeless wardrobe essential for everyday comfort.',
    rate: 4.7,
    isFavorite: false,
    startColor: Color.fromARGB(255, 246, 179, 161),
    endColor: Color.fromARGB(255, 237, 183, 158),
  ),
  Clothes(
    image: 'white-tshirt.png',
    name: 'White TShirt',
    des:
        'Keep it clean and versatile with our crisp white tee, a wardrobe staple that complements any look.',
    rate: 4.7,
    isFavorite: false,
    startColor: Color.fromARGB(255, 246, 179, 161),
    endColor: Color.fromARGB(255, 237, 183, 158),
  ),
  Clothes(
    image: 'black-tshirt.png',
    name: 'Black TShirt',
    des:
        'Elevate your style with our sleek black tee, a go-to piece that adds an air of sophistication.',
    rate: 4.9,
    isFavorite: false,
    startColor: Color.fromARGB(255, 246, 179, 161),
    endColor: Color.fromARGB(255, 237, 183, 158),
  ),
  Clothes(
    image: 'maroon-tshirt.png',
    name: 'Maroon TShirt',
    des:
        'Unleash your inner charm with our maroon tee, a rich hue that exudes confidence and allure.',
    rate: 4.9,
    isFavorite: false,
    startColor: Color.fromARGB(255, 246, 179, 161),
    endColor: Color.fromARGB(255, 237, 183, 158),
  ),
  Clothes(
    image: 'green-tshirt.png',
    name: 'Green TShirt',
    des:
        'Connect with nature in our refreshing green tee, a symbol of growth and renewal for your everyday adventures.',
    rate: 4.9,
    isFavorite: false,
    startColor: Color.fromARGB(255, 246, 179, 161),
    endColor: Color.fromARGB(255, 237, 183, 158),
  ),
  Clothes(
    image: 'pant.png',
    name: 'Yellow Pant',
    des:
        ' Embrace sunshine vibes with our chic yellow pants, a pop of color that radiates positivity and fashion-forward flair.',
    rate: 4.9,
    isFavorite: false,
    startColor: Color.fromARGB(255, 246, 179, 161),
    endColor: Color.fromARGB(255, 237, 183, 158),
  ),
];
