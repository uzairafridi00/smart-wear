import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/color_constant.dart';
import '../../../main.dart';

class ThirdPageSlider extends StatelessWidget {
  const ThirdPageSlider({Key? key}) : super(key: key);

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
              image: AssetImage('assets/images/3.png'),
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
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Fashion is an extension,\n    of your ',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'geometric',
                            fontSize: 30)),
                    TextSpan(
                        text: 'personality\n',
                        style: TextStyle(
                            color: Color(0xffFF7029),
                            fontFamily: 'geometric',
                            fontSize: 30)),
                  ]),
                ),
                Positioned(
                    right: 70,
                    top: 75,
                    child: SvgPicture.asset(
                      'assets/images/Vector.svg',
                      width: 85,
                    )),
                SizedBox(
                  height: 40,
                )
              ],
            ),
            RichText(
                text: const TextSpan(
                    text:
                        'At Smart Wear, you will get outfits\n recommendation using our AI tool',
                    style: TextStyle(
                        color: descriptionTextColor,
                        fontSize: 18,
                        fontFamily: 'gillsans')))
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/main');
          },
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AuthWrapper(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 40),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: ColorConstant.amber700,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'switzer'),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
