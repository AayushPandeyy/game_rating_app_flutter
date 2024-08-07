import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final games = gameProvider.games;

    List<Widget> carouselItems = games
        .map((game) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GameDetailsPage()));
              gameProvider.selectGame(game);
            },
            child: GameCard(imageUrl: game.imageUrl, date: game.date)))
        .toList();
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(color: Colors.black),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: const Text(
                      "Trending",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 40,
                          fontFamily: "AldotheApache",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                      aspectRatio: 16 / 7,
                      height: 400,
                      animateToClosest: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
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
                const GameRatingCard(),
                const SizedBox(
                  height: 10,
                ),
                const GameRatingCard(),
                const SizedBox(
                  height: 10,
                ),
                const GameRatingCard(),
                const SizedBox(
                  height: 10,
                ),
                const GameRatingCard(),
                const SizedBox(
                  height: 10,
                ),
                const GameRatingCard(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
