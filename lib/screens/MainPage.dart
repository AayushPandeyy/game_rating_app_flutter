import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/screens/FavoritesScreen.dart';
import 'package:game_rating_app/screens/HomePage.dart';
import 'package:game_rating_app/screens/ProfileScreen.dart';
import 'package:game_rating_app/screens/SearchScreen.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  int currentSelected = 0;
  final pages = const [
    HomePage(),
    SearchScreen(),
    FavoritesScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.yellow,
        currentIndex: currentSelected,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            currentSelected = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.black),
        ],
      ),
      body: pages[currentSelected],
    );
  }
}
