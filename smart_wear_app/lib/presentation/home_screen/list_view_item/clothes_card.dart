import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/clothes_model.dart';

class ClothesCard extends StatelessWidget {
  const ClothesCard({Key? key, this.active, this.index, required this.clothe})
      : super(key: key);

  final bool? active;
  final int? index;
  final Clothes clothe;

  @override
  Widget build(BuildContext context) {
    final double blur = active! ? 13 : 0;
    final double offset = active! ? 4 : 0;
    final double top = active! ? 0 : 46;
    return Column(
      children: [
        SizedBox(
          height: 345,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutQuint,
            margin: EdgeInsets.only(
              top: top,
              bottom: 0,
              right: 15.5,
              left: active! ? 28 : 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: clothe.startColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black87.withOpacity(0.3),
                    blurRadius: blur,
                    offset: Offset(0, offset)),
              ],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/shirts/${clothe.image}')),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    gradient: LinearGradient(
                      colors: [
                        clothe.startColor!,
                        //clothe.endColor!.withOpacity(0.01),
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      tileMode: TileMode.clamp,
                      stops: const [0.1, 0.4],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${clothe.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.yellow.shade700,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("${clothe.rate}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
