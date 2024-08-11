import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/screens/RateGameScreen.dart';
import 'package:game_rating_app/widgets/detailsScreen_widgets/DetailsBox.dart';
import 'package:game_rating_app/widgets/detailsScreen_widgets/ReviewBox.dart';
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
    List<String> screenshotImageUrls = [
      'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png',
      'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png'
    ];
    final gameProvider = Provider.of<GameProvider>(context);
    final game = gameProvider.selectedGame;
    if (game == null) {
      return const Center(
        child: Text("No game"),
      );
    }
    List<Widget> screenshots = screenshotImageUrls
        .map((url) => Image(image: NetworkImage(url)))
        .toList();
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
                  Container(
                    width: double.maxFinite,
                    // height: 50,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.red],
                              stops: [0.4, 0.7]),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        game.title,
                        style: const TextStyle(
                            fontSize: 30,
                            fontFamily: "AldotheApache",
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DetailsBox(),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "4 / 10",
                        style: TextStyle(
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RateGameScreen()));
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
                  const Text(
                    "System Requirements",
                    style: TextStyle(
                        fontFamily: "AldotheApache",
                        fontSize: 40,
                        color: Colors.yellow),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SystemRequirements(
                      os: game.os,
                      processor: game.processor,
                      memory: game.memory,
                      graphics: game.graphics),
                  const Text(
                    "Game Reviews",
                    style: TextStyle(
                        fontFamily: "AldotheApache",
                        fontSize: 40,
                        color: Colors.yellow),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CarouselSlider(
                    items: const[
                       ReviewBox(),
                       ReviewBox(),
                       ReviewBox(),
                       ReviewBox(),
                       ReviewBox()
                    ],
                    options: CarouselOptions(
                      height: 350,
                      enableInfiniteScroll: false,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
