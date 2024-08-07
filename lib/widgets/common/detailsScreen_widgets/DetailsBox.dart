import 'package:flutter/material.dart';

class DetailsBox extends StatelessWidget {
  const DetailsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 350,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Publisher : Epic Games",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Exo2"),
          ),
          Text(
            "Developer : Epic Games",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Exo2"),
          ),
          Text(
            "Genre : RPG",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Exo2"),
          ),
          Text(
            "Price : Free",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Exo2"),
          ),
        ],
      ),
    );
  }
}
