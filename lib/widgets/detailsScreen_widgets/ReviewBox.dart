import 'package:flutter/cupertino.dart';
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
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(20)),
      height: 300,
      width: 250,
      child: Column(
        children: [],
      ),
    );
  }
}
