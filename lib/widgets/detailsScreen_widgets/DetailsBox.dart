import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsBox extends StatelessWidget {
  const DetailsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      // width: 350,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Publisher : Epic Games",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SpaceGrotesk"),
            ),
            Container(
              width: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
            ),
            Text(
              "Developer : Epic Games",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SpaceGrotesk"),
            ),
            Container(
              width: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
            ),
            Text(
              "Genre : RPG",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SpaceGrotesk"),
            ),
            Container(
              width: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
            ),
            Text(
              "Price : Free",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SpaceGrotesk"),
            ),
            Container(
              width: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
