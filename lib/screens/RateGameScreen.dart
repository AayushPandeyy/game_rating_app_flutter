import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:provider/provider.dart';

class RateGameScreen extends StatefulWidget {
  const RateGameScreen({super.key});

  @override
  State<RateGameScreen> createState() => _RateGameScreenState();
}

class _RateGameScreenState extends State<RateGameScreen> {
  TextEditingController controller = TextEditingController();
  int? selectedRating;

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final game = gameProvider.selectedGame;
    if (game == null) {
      return const Center(
        child: Text("No game"),
      );
    }
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
                "Go Back",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: AutoSizeText(
                      maxLines: 1,
                      "Rate ${game.title}",
                      style: const TextStyle(
                        fontSize: 50,
                        fontFamily: "Gabarito",
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 1; i < 6; i++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRating = i;
                            });
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: selectedRating == i
                                  ? Colors.pink
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.pink),
                            ),
                            child: Center(
                              child: Text(
                                i.toString(),
                                style: TextStyle(
                                  color: selectedRating == i
                                      ? Colors.black
                                      : Colors.pink,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Leave a review",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: controller,
                      maxLines: 20,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Colors.pink,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey[400],
                          ),
                          onPressed: () {
                            controller.text = "";
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(controller.text);
                      print(selectedRating);
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text(
                        "Submit Rating",
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
      ),
    );
  }
}
