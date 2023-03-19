import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/constants.dart';

class SecondPageSlider extends StatelessWidget {
  const SecondPageSlider({Key? key}) : super(key: key);

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
              image: AssetImage('assets/images/2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30, top: 70),
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
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Stack(
              children: [
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'Revolutionize your \n shopping ',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'geometric',
                            fontSize: 30)),
                    TextSpan(
                        text: 'experience\n',
                        style: TextStyle(
                            color: Color(0xffFF7029),
                            fontFamily: 'geometric',
                            fontSize: 30)),
                  ]),
                ),
                Positioned(
                    right: 30,
                    top: 75,
                    child: SvgPicture.asset(
                      'assets/images/Vector.svg',
                      width: 85,
                    )),
              ],
            ),
            RichText(
                text: TextSpan(
                    text:
                        'We are here to guide you on your fashion\n journey and help you discover. The looks\n          looks that make you shine',
                    style: TextStyle(
                        color: descriptionTextColor,
                        fontSize: 18,
                        fontFamily: 'gillsans')))
          ],
        ),
      ]),
    );
  }
}
