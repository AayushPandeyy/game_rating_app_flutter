import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/providers/AuthProvider.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/screens/GameDetailsPage.dart';
import 'package:game_rating_app/widgets/common/GameCard.dart';
import 'package:game_rating_app/widgets/homescreen_widgets/GameRatingCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final games = gameProvider.games;

    List<Widget> carouselItems = games
        .map((game) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GameDetailsPage()));
              gameProvider.selectGame(game);
            },
            child: GameCard(imageUrl: game.imageUrl, genre: game.genre)))
        .toList();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(20, 50),
          child: Container(
              color: Colors.black,
              child: authProvider.isLoading
                  ? const CircularProgressIndicator()
                  : Center(
                      child: Text("Hello ${authProvider.user!.username}",
                          style: TextStyle(color: Colors.white)))),
        ),
        body: gameProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.black),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      
                      const SizedBox(height: 20),
                      CarouselSlider(
                        items: carouselItems,
                        options: CarouselOptions(
                            aspectRatio: 16 / 7,
                            height: 400,
                            animateToClosest: true,
                            enlargeCenterPage: false,
                            autoPlay: true),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "All Time Best",
                        style: TextStyle(
                            fontFamily: "Gabarito",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          for (int index = 0; index < 5; index++)
                            const GameRatingCard(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
