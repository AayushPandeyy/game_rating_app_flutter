import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game_rating_app/models/Game.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/screens/GameDetailsPage.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Game> games = [];
  List<Game> filteredGames = [];

  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final gameProvider = Provider.of<GameProvider>(context, listen: false);
      await gameProvider.fetchGames();
      setState(() {
        games = gameProvider.games;
        filteredGames = []; // Initialize with the full list
      });
    });
  }

  void _filterGames(String query) {
    setState(() {
      searchQuery = query;
      if (query.isNotEmpty) {
        filteredGames = games
            .where((game) =>
                game.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredGames = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        _filterGames(value);
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Search',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter a search term',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: filteredGames.isEmpty
                    ? Center(
                        child: Text(
                          "Search Games",
                          style: TextStyle(
                            fontFamily: "Gabarito",
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredGames.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GameDetailsPage()));
                                  gameProvider
                                      .selectGame(filteredGames[index]);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                  ),
                                  height: 50,
                                  width: 350,
                                  child: Center(
                                    child: Text(
                                      filteredGames[index].title,
                                      style: TextStyle(
                                        fontFamily: "Gabarito",
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
