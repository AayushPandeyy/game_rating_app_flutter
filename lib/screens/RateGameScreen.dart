// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:game_rating_app/providers/AuthProvider.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/services/rating_service.dart';

class RateGameScreen extends StatefulWidget {
  final String? ratingId;
  final String? title;
  final String? content;
  final int? rating;
  final VoidCallback onSubmit;

  const RateGameScreen({
    Key? key,
    this.title,
    this.content,
    this.rating,
    required this.onSubmit,
    this.ratingId,
  }) : super(key: key);

  @override
  State<RateGameScreen> createState() => _RateGameScreenState();
}

class _RateGameScreenState extends State<RateGameScreen> {
  bool update = false;
  final RatingService service = RatingService();

  void postRating() async {
    if (selectedRating == null ||
        titleController.text.isEmpty ||
        contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields')),
      );
      return;
    }

    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    final game = gameProvider.selectedGame;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      await service.postRating(
          titleController.text,
          contentController.text,
          selectedRating!,
          authProvider.user!.username,
          game!.id,
          authProvider.user!.id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rating submitted successfully')),
      );
      widget.onSubmit();
      Navigator.pop(context);
      reset();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit rating: $e')),
      );
    }
  }

  void updateRating() async {
    if (selectedRating == null ||
        titleController.text.isEmpty ||
        contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields')),
      );
      return;
    }

    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    final game = gameProvider.selectedGame;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final ratingData = {
      '_id': widget.ratingId,
      'game_id': game!.id,
      'user_id': authProvider.user!.id,
      'author': authProvider.user!.username,
      'title': titleController.text,
      'content': contentController.text,
      "starRating": selectedRating
    };

    try {
      await service.updateRating(widget.ratingId!, ratingData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rating Updated successfully')),
      );
      widget.onSubmit();
      Navigator.pop(context);
      reset();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to Update rating: $e')),
      );
    }
  }

  void reset() {
    titleController.text = "";
    contentController.text = "";
  }

  TextEditingController contentController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  int? selectedRating;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.getUser();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.content != null &&
        widget.title != null &&
        widget.rating != null) {
      setState(() {
        selectedRating = widget.rating;
        update = true;
      });
      titleController.text = widget.title!;
      contentController.text = widget.content!;
    }
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
                    "Title",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: titleController,
                      maxLines: 1,
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
                            titleController.text = "";
                          },
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Leave a review",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: contentController,
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
                            contentController.text = "";
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
                      update ? updateRating() : postRating();
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        update ? "Update Rating" : "Submit Rating",
                        style: const TextStyle(
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
