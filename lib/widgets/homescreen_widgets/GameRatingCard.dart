import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/screens/GameDetailsPage.dart';

class GameRatingCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String platform;
  final String publisher;
  final double rating;
  final int rank;
  const GameRatingCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.platform,
      required this.publisher,
      required this.rating,
      required this.rank});

  @override
  State<GameRatingCard> createState() => _GameRatingCardState();
}

class _GameRatingCardState extends State<GameRatingCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.yellow),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image(
                image: NetworkImage(widget.imageUrl),
                height: 50,
                width: 50,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      maxLines: 1,
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.platform,
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    AutoSizeText(
                      maxLines: 1,
                      widget.publisher,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "# ${widget.rank.toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.rating.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.star)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
