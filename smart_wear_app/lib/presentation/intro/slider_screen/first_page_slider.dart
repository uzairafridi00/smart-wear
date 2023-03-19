import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/constants.dart';

class FirstPageSlider extends StatelessWidget {
  const FirstPageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40)),
            image: DecorationImage(
              image: AssetImage('assets/images/1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 30, top: 70),
              child: Text(
                "",
                style: TextStyle(
                    color: skipColorButton,
                    fontSize: 16,
                    fontFamily: 'gillsans'),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Stack(
              children: [
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'Fashion Fades\n    style is ',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'geometric',
                            fontSize: 30)),
                    TextSpan(
                        text: 'eternal\n',
                        style: TextStyle(
                            color: Color(0xffFF7029),
                            fontFamily: 'geometric',
                            fontSize: 30)),
                  ]),
                ),
                Positioned(
                  right: 20,
                  top: 70,
                  child: SvgPicture.asset('assets/images/Vector.svg'),
                ),
              ],
            ),
            RichText(
              text: const TextSpan(
                text:
                    'At Smart Wear, we provide reliable \n and trutworthy fashion designs to\n       people all over the world',
                style: TextStyle(
                    color: descriptionTextColor,
                    fontSize: 18,
                    fontFamily: 'gillsans'),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
