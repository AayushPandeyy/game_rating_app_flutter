import 'package:flutter/material.dart';

class SystemRequirements extends StatelessWidget {
  final String os;
  final String processor;
  final String memory;
  final String graphics;
  const SystemRequirements(
      {super.key,
      required this.os,
      required this.processor,
      required this.memory,
      required this.graphics});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      width: double.maxFinite - 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "OS",
              style: TextStyle(
                  fontFamily: "AldotheApache", fontSize: 20, color: Colors.red),
            ),
            Text(
              textAlign: TextAlign.center,
              os,
              style: TextStyle(
                  fontFamily: "SpaceGrotesk",
                  fontSize: 25,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Processor",
              style: TextStyle(
                  fontFamily: "AldotheApache", fontSize: 20, color: Colors.red),
            ),
            Text(
              textAlign: TextAlign.center,
              processor,
              style: TextStyle(
                  fontFamily: "SpaceGrotesk",
                  fontSize: 25,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Memory",
              style: TextStyle(
                  fontFamily: "AldotheApache", fontSize: 20, color: Colors.red),
            ),
            Text(
              textAlign: TextAlign.center,
              memory,
              style: TextStyle(
                  fontFamily: "SpaceGrotesk",
                  fontSize: 25,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Graphics",
              style: TextStyle(
                  fontFamily: "AldotheApache", fontSize: 20, color: Colors.red),
            ),
            Text(
              textAlign: TextAlign.center,
              graphics,
              style: TextStyle(
                  fontFamily: "SpaceGrotesk",
                  fontSize: 25,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
