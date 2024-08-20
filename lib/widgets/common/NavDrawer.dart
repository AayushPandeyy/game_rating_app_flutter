import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/screens/HomePage.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Drawer(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/game_logo.jpg"),
                      fit: BoxFit.fitWidth),
                  color: Colors.blue,
                ),
                child: SizedBox.shrink(),
              ),
              ListTile(
                title: Center(
                    child: const Text('Driver Standings',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "SpaceGrotesk",
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                onTap: () {
                  if (ModalRoute.of(context)!.settings.name != "standings") {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: ((context) => HomePage())));
                  }

                  Scaffold.of(context).closeDrawer();
                },
              ),
              ListTile(
                title: Center(
                    child: const Text('Constructor Standings',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "SpaceGrotesk",
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                onTap: () {
                  if (ModalRoute.of(context)!.settings.name != "consStanding") {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: ((context) => HomePage())));
                  }

                  Scaffold.of(context).closeDrawer();
                },
              ),
              ListTile(
                title: Center(
                    child: const Text('Profile',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "SpaceGrotesk",
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Center(
                    child: const Text('Mercedes Club',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "SpaceGrotesk",
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
