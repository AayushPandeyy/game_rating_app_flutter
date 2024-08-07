import 'package:flutter/material.dart';

class SystemRequirements extends StatelessWidget {
  const SystemRequirements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite - 100,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(247, 147, 113, 113)),
          borderRadius: BorderRadius.circular(20)),
      child: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "System Requirements",
              style: TextStyle(
                  fontFamily: "AldotheApache",
                  fontSize: 40,
                  color: Colors.yellow),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "OS",
              style: TextStyle(
                  fontFamily: "AldotheApache", fontSize: 20, color: Colors.red),
            ),
            Text(
              "WIN 7-64 bit",
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
              "Intel i3-2100 / AMD A8-5600k",
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
              "8 GB RAM",
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
              "GeForce GTX 630 / Radeon HD 6570",
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
