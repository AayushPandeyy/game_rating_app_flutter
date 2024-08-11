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
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  "Publisher : ",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SpaceGrotesk"),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  game!.publisher,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SpaceGrotesk"),
                ),
              ],
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(255, 87, 80, 80))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Developer : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SpaceGrotesk"),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  game.developer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SpaceGrotesk"),
                ),
              ],
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(255, 87, 80, 80))),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Price : ",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SpaceGrotesk"),
                ),
                SizedBox(),
                Text(
                  "Free",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SpaceGrotesk"),
                ),
              ],
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(255, 87, 80, 80))),
            ),
          ],
        ),
      ),
    );
  }
}
