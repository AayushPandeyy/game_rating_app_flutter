import 'package:flutter/material.dart';


class GameCard extends StatefulWidget {
  final String imageUrl;
  final String genre;
  const GameCard({super.key, required this.imageUrl, required this.genre});

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(widget.imageUrl),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              widget.genre,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
