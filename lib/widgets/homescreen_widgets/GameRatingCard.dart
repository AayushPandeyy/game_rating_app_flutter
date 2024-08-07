import 'package:flutter/material.dart';
import 'package:game_rating_app/screens/GameDetailsPage.dart';

class GameRatingCard extends StatefulWidget {
  const GameRatingCard({super.key});

  @override
  State<GameRatingCard> createState() => _GameRatingCardState();
}

class _GameRatingCardState extends State<GameRatingCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>const GameDetailsPage()));
      },
      child: Container(
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.yellow),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                  "https://cloudgames.gg/wp-content/uploads/the-wolf-among-us-2-portrait.jpg"),
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Super Mario Galaxy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Nintendo, 2007',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    'Wii',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '#1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '97.64 %',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
