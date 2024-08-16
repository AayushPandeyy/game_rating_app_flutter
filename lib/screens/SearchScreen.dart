import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> gameNames = [];
  List<String> filteredGames = [];
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final gameProvider = Provider.of<GameProvider>(context, listen: false);
      gameProvider.fetchGames();
      setState(() {
        gameNames.addAll(gameProvider.games.map((game) => game.title).toList());
      });
      print(gameNames);
    });
  }

  void _filterGames(String query) {
    List<String> _games = [];

    _games.addAll(gameNames);
    if (query.isNotEmpty) {
      _games.retainWhere(
          (game) => game.toLowerCase().contains(query.toLowerCase()));
    }

    setState(() {
      filteredGames = _games;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          onChanged: (value) {
                            _filterGames(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Enter a search term',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: filteredGames.length == 0
                        ? Center(
                            child: Text(
                              "Search Games",
                              style: TextStyle(
                                  fontFamily: "Gabarito",
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                          )
                        : ListView.builder(
                            itemCount: filteredGames.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white),
                                        color: Colors.white),
                                    height: 50,
                                    width: 350,
                                    child: Center(
                                        child: Text(
                                      filteredGames[index],
                                      style: TextStyle(
                                          fontFamily: "Gabarito",
                                          fontSize: 20,
                                          color: Colors.black),
                                    )),
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
            )));
  }
}
