import 'package:flutter/material.dart';
import 'package:game_rating_app/models/Game.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/screens/GameDetailsPage.dart';
import 'package:game_rating_app/widgets/homescreen_widgets/GameRatingCard.dart';
import 'package:provider/provider.dart';

class Alltimehighratedscreen extends StatefulWidget {
  const Alltimehighratedscreen({super.key});

  @override
  State<Alltimehighratedscreen> createState() => _AlltimehighratedscreenState();
}

class _AlltimehighratedscreenState extends State<Alltimehighratedscreen> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    List<Game> topRated = gameProvider.topRated;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'All Time Ranking',
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 40,
                fontFamily: "AldotheApache",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
            itemCount: topRated.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  gameProvider.selectGame(topRated[index]);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GameDetailsPage()));
                },
                child: GameRatingCard(
                  imageUrl: topRated[index].imageUrl,
                  title: topRated[index].title,
                  publisher: topRated[index].publisher,
                  rating: topRated[index].rating,
                  platform: topRated[index].platform,
                  rank: index + 1,
                ),
              );
            }),
      ),
    );
  }
}
