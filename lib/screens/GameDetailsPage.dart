import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/utilities/RatingDialog.dart';
import 'package:game_rating_app/widgets/detailsScreen_widgets/DetailsBox.dart';
import 'package:game_rating_app/widgets/detailsScreen_widgets/SystemRequirements.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

class GameDetailsPage extends StatefulWidget {
  const GameDetailsPage({super.key});

  @override
  State<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final game = gameProvider.selectedGame;
    if (game == null) {
      return const Center(
        child: Text("No game"),
      );
    }
    List<Widget> screenshots = game.screenshotImageUrls
        .map((url) => Image(image: NetworkImage(url)))
        .toList();
    double rating = game.getFinalRating();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(400, 100),
          child: Container(
            height: 50,
            color: Colors.black,
            child: Row(children: [
              const SizedBox(
                width: 20,
              ),
              IconButton(
                alignment: Alignment.centerLeft,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
                iconSize: 30,
              ),
              const Text(
                "Home",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          // color: Color.fromARGB(255, 122, 15, 38),
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(game.imageUrl),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container()),
                  const SizedBox(
                    height: 10,
                  ),
                  const DetailsBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    // height: 70,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.black],
                              stops: [0.4, 0.7]),
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        game.title,
                        style: const TextStyle(
                            fontSize: 40,
                            fontFamily: "Debug",
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      game.description,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "SpaceGrotesk"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$rating / 10",
                        style: const TextStyle(
                            fontFamily: "Gabarito",
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.star,
                        size: 50,
                        color: Colors.pink,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      RatingDialog().showRatingDialog(context);
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text(
                        "Rate Now",
                        style: TextStyle(
                            fontFamily: "Gabarito",
                            fontSize: 20,
                            color: Colors.pink),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      "Screenshots",
                      style: TextStyle(
                          fontFamily: "AldotheApache",
                          fontSize: 40,
                          color: Colors.yellow),
                    ),
                  ),
                  CarouselSlider(
                      items: screenshots,
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true)),
                  const SizedBox(
                    height: 10,
                  ),
                  SystemRequirements(
                    os: game.systemRequirements[0],
                    processor: game.systemRequirements[1],
                    memory: game.systemRequirements[2],
                    graphics: game.systemRequirements[3],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
