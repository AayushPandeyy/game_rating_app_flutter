import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:provider/provider.dart';

class DetailsBox extends StatelessWidget {
  const DetailsBox({super.key});

  @override
  Widget build(BuildContext context) {
    final gameprovider = Provider.of<GameProvider>(context);
    final game = gameprovider.selectedGame;
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
              "Publisher : ${game!.publisher}",
              textAlign: TextAlign.center,
              style: const TextStyle(
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
              "Developer : ${game.developer}",
              textAlign: TextAlign.center,
              style: const TextStyle(
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
              "Genre : ${game.publisher}",
              textAlign: TextAlign.center,
              style: const TextStyle(
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
            const Text(
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
