import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/color_constant.dart';
import './slider_screen/first_page_slider.dart';
import './slider_screen/second_page_slider.dart';
import './slider_screen/third_page_slider.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);
  final contoller = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * .4;
    return Stack(children: [
      PageView(
        controller: contoller,
        children: const [
          FirstPageSlider(),
          SecondPageSlider(),
          ThirdPageSlider()
        ],
      ),
      Positioned(
          bottom: 113,
          left: size,
          child: SmoothPageIndicator(
            controller: contoller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: ColorConstant.amber700,
              dotColor: ColorConstant.amber300,
            ),
          )),
    ]);
  }
}
