import 'package:flutter/material.dart';
import 'package:game_rating_app/screens/FavoritesScreen.dart';
import 'package:game_rating_app/screens/HomePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentSelected = 0;
  final pages = const [HomePage(), FavoritesScreen()];
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
        ],
      ),
      body: pages[currentSelected],
    );
  }
}
