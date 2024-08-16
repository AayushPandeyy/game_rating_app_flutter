import 'package:flutter/material.dart';
import 'package:game_rating_app/screens/FavoritesScreen.dart';
import 'package:game_rating_app/screens/HomePage.dart';
import 'package:game_rating_app/screens/ProfileScreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentSelected = 0;
  final pages = const [HomePage(), FavoritesScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.yellow,
        currentIndex: currentSelected,
        onTap: (index) {
          setState(() {
            currentSelected = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: pages[currentSelected],
    );
  }
}
