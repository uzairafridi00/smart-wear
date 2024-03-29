import 'package:flutter/material.dart';

import '../../models/clothes_model.dart';
import './list_view_item/clothes_card.dart';
import 'details/full_screen_clothes_view.dart';

class PageViewClothesList extends StatefulWidget {
  const PageViewClothesList({super.key});

  @override
  State<PageViewClothesList> createState() => _PageViewClothesListState();
}

class _PageViewClothesListState extends State<PageViewClothesList> {
  final PageController pageController = PageController(viewportFraction: 0.90);
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: PageView.builder(
        padEnds: false,
        controller: pageController,
        itemCount: destination.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          bool active = index == currentpage;
          return Opacity(
            opacity: currentpage == index ? 1.0 : 0.5,
            child: GestureDetector(
              onTap: () {
                // Navigate to the full-screen view of the shirt
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FullScreenClothesView(clothe: destination[index]),
                  ),
                );
              },
              child: ClothesCard(
                active: active,
                index: index,
                clothe: destination[index],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController.addListener(() {
      int position = pageController.page!.round();
      if (currentpage != position) {
        setState(() {
          currentpage = position;
        });
      }
    });
  }
}
