import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/providers/AuthProvider.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/screens/AllTimeHighRatedScreen.dart';
import 'package:game_rating_app/screens/GameDetailsPage.dart';
import 'package:game_rating_app/widgets/common/GameCard.dart';
import 'package:game_rating_app/widgets/common/NavDrawer.dart';
import 'package:game_rating_app/widgets/homescreen_widgets/GameRatingCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop(); // Close the drawer
  }

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
    final topRated = gameProvider.topRated;

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
        drawer: const NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Text(
            'Hello ${authProvider.user!.username}',
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 40,
                fontFamily: "AldotheApache",
                fontWeight: FontWeight.bold),
          ),
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
                            GestureDetector(
                              onTap: () {
                                gameProvider.selectGame(topRated[index]);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const GameDetailsPage()));
                              },
                              child: GameRatingCard(
                                imageUrl: topRated[index].imageUrl,
                                title: topRated[index].title,
                                publisher: topRated[index].publisher,
                                rating: topRated[index].rating,
                                platform: topRated[index].platform,
                                rank: index + 1,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Alltimehighratedscreen()));
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: Text(
                            "See All",
                            style: TextStyle(
                                fontFamily: "Gabarito",
                                fontSize: 20,
                                color: Colors.pink),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
