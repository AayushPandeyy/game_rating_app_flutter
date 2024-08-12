import 'package:flutter/material.dart';

class ReviewBox extends StatefulWidget {
  final String title;
  final String author;
  final String content;
  final int stars;
  const ReviewBox(
      {super.key,
      required this.title,
      required this.author,
      required this.content, required this.stars});

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
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                textAlign: TextAlign.center,
                widget.title,
                style: TextStyle(
                    fontFamily: "Gabarito", fontSize: 30, color: Colors.white),
              ),
            ),
            Text(
              "By ${widget.author}",
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
                    widget.content,
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
