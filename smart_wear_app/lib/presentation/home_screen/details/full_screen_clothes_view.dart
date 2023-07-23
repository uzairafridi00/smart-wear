import 'package:flutter/material.dart';
import '../../../models/clothes_model.dart';

import 'package:flutter/material.dart';
import '../../../models/clothes_model.dart';

class FullScreenClothesView extends StatelessWidget {
  final Clothes clothe;

  FullScreenClothesView({required this.clothe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                // When tapping the enlarged image, navigate back to the previous screen
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: clothe.startColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.3),
                      blurRadius: 13,
                      offset: Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/shirts/${clothe.image}'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${clothe.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${clothe.des}', // Replace with your desired description
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,
                        color: Colors
                            .amber[700], // Adjust the color of the heart icon
                        size: 35, // Adjust the size of the heart icon
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add action for the button, if needed
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber[
                            600], // Change the background color of the button
                        onPrimary:
                            Colors.white, // Change the text color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Add rounded corners to the button
                        ),
                        elevation: 4, // Add a shadow to the button
                        padding: EdgeInsets.symmetric(
                            vertical: 16), // Adjust the padding as needed
                      ),
                      child: Text(
                        'Try On', // Replace with your desired button text
                        style: TextStyle(
                            fontSize: 18), // Adjust the font size as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
