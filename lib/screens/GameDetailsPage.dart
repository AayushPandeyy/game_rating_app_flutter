import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/widgets/common/detailsScreen_widgets/SystemRequirements.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GameDetailsPage extends StatefulWidget {
  const GameDetailsPage({super.key});

  @override
  State<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  @override
  Widget build(BuildContext context) {
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
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://cdn1.epicgames.com/95d0b9561be1464cb43bd029e94cf526/offer/GR_Portrait_Offer_1200x1600-1200x1600-a7811e23904db375486535513d10412f.jpg"),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container()),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.black],
                              stops: [0.4, 0.7]),
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "GhostRunner",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: "Debug",
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      "Ghostrunner is a hardcore FPP game packed with lightning-fast action, set in a grim, cyberpunk megastructure. Climb Dharma Tower, humanity’s last shelter, after a world-ending cataclysm. Make your way up from the bottom to the top, confront the tyrannical Keymaster, and take your revenge.The streets of this tower city are full of violence. Mara the Keymaster rules with an iron fist and little regard for human life.As resources diminish, the strong prey on the weak and chaos threatens to consume what little order remains. The decisive last stand is coming. A final attempt to set things right before mankind goes over the edge of extinction.As the most advanced blade fighter ever created, you’re always outnumbered but never outclassed. Slice your enemies with a monomolecular katana, dodge bullets with your superhuman reflexes, and employ a variety of specialized techniques to prevail.One-hit one-kill mechanics make combat fast and intense. Use your superior mobility (and frequent checkpoints!) to engage in a never-ending dance with death fearlessly.Ghostrunner offers a unique single-player experience: fast-paced, violent combat, and an original setting that blends science fiction with post-apocalyptic themes. It tells the story of a world that has already ended and its inhabitants who fight to survive.",
                      style: TextStyle(
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
                      for (var i = 0; i < 5; i++)
                        const Icon(
                          Icons.star,
                          size: 50,
                          color: Colors.pink,
                        )
                    ],
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
                  Container(
                    child: CarouselSlider(
                        items: [
                          Image(
                              image: NetworkImage(
                                  "https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png")),
                          Image(
                              image: NetworkImage(
                                  "https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png")),
                          Image(
                              image: NetworkImage(
                                  "https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png")),
                          Image(
                              image: NetworkImage(
                                  "https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png")),
                          Image(
                              image: NetworkImage(
                                  "https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png")),
                          Image(
                              image: NetworkImage(
                                  "https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png")),
                        ],
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SystemRequirements(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
