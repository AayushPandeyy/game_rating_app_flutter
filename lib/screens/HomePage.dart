import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/widgets/common/GameCard.dart';
import 'package:game_rating_app/widgets/homescreen_widgets/GameRatingCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                      "Upcoming",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 40,
                          fontFamily: "Gabarito",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  items: [
                    GameCard(
                      imageUrl:
                          "https://cdn1.epicgames.com/95d0b9561be1464cb43bd029e94cf526/offer/GR_Portrait_Offer_1200x1600-1200x1600-a7811e23904db375486535513d10412f.jpg",
                      date: "TBA, 2022",
                    ),
                    GameCard(
                      imageUrl:
                          "https://m.media-amazon.com/images/M/MV5BMTc0NjYzYmUtYmIyZC00OThmLWJhYjctOWIyYjIxMzFjMTUwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg",
                      date: "TBA, 2023",
                    ),
                    GameCard(
                      imageUrl:
                          "https://cloudgames.gg/wp-content/uploads/the-wolf-among-us-2-portrait.jpg",
                      date: "TBA, 2024",
                    ),
                    GameCard(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNINvn9xlNoe2PNXvBgOBL2VDo0ZKfCcETug&s",
                      date: "TBA, 2026",
                    ),
                    GameCard(
                      imageUrl:
                          "https://cdn1.epicgames.com/95d0b9561be1464cb43bd029e94cf526/offer/GR_Portrait_Offer_1200x1600-1200x1600-a7811e23904db375486535513d10412f.jpg",
                      date: "TBA, 2022",
                    ),
                    GameCard(
                      imageUrl:
                          "https://m.media-amazon.com/images/M/MV5BMTc0NjYzYmUtYmIyZC00OThmLWJhYjctOWIyYjIxMzFjMTUwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg",
                      date: "TBA, 2023",
                    ),
                    GameCard(
                      imageUrl:
                          "https://cloudgames.gg/wp-content/uploads/the-wolf-among-us-2-portrait.jpg",
                      date: "TBA, 2024",
                    ),
                    GameCard(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNINvn9xlNoe2PNXvBgOBL2VDo0ZKfCcETug&s",
                      date: "TBA, 2026",
                    ),
                  ],
                  options: CarouselOptions(
                      aspectRatio: 16 / 7,
                      height: 400,
                      animateToClosest: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "All Time Best",
                  style: TextStyle(
                      fontFamily: "Gabarito",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                ),
                SizedBox(
                  height: 20,
                ),
                GameRatingCard(),
                SizedBox(
                  height: 10,
                ),
                GameRatingCard(),
                SizedBox(
                  height: 10,
                ),
                GameRatingCard(),
                SizedBox(
                  height: 10,
                ),
                GameRatingCard(),
                SizedBox(
                  height: 10,
                ),
                GameRatingCard(),
                SizedBox(
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
