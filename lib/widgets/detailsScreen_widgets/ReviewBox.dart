import 'package:flutter/material.dart';

class ReviewBox extends StatefulWidget {
  const ReviewBox({super.key});

  @override
  State<ReviewBox> createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:
                  Colors.white.withOpacity(0.25), // Shadow color with opacity
              blurRadius: 10, // The higher the value, the softer the shadow
              spreadRadius:
                  5, // The higher the value, the larger the shadow area
              offset:
                  Offset(0, 5), // Horizontal and vertical offset of the shadow
            ),
          ],
          color: const Color.fromARGB(255, 57, 57, 57),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      height: 350,
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                textAlign: TextAlign.center,
                "A Gaming Masterpiece",
                style: TextStyle(
                    fontFamily: "Gabarito", fontSize: 30, color: Colors.white),
              ),
            ),
            const Text(
              "By Aayush Pandey",
              style: TextStyle(
                  fontFamily: "Gabarito", fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(255, 87, 80, 80))),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Text(
                    "The Legend of Zelda: Breath of the Wild is an absolute masterpiece that redefines what an open-world game can be. From the moment you step into the vast, beautifully rendered world of Hyrule, you're given the freedom to explore at your own pace, tackling challenges in any order you choose. The game's innovative mechanics, like weapon durability and dynamic weather, add layers of strategy to every encounter, while the sheer variety of environments and puzzles keeps the experience fresh from start to finish. Whether you're scaling mountains, solving intricate puzzles, or engaging in epic battles, every moment in Breath of the Wild feels like an adventure, making it one of the most captivating and immersive games I've ever played.",
                    overflow: TextOverflow.fade,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  const Icon(
                    Icons.star,
                    color: Colors.pink,
                  )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
