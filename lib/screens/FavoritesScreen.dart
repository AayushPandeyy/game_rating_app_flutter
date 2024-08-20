import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game_rating_app/models/Favorites.dart';
import 'package:game_rating_app/models/Game.dart';
import 'package:game_rating_app/providers/AuthProvider.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/screens/GameDetailsPage.dart';
import 'package:game_rating_app/services/favorites_service.dart';
import 'package:game_rating_app/services/game_service.dart';
import 'package:game_rating_app/widgets/favorites_screen_widgets/FavoriteGameCard.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Game> games = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await getFavoriteGames();
    });
  }

  Future<void> getFavoriteGames() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.getUser();

    if (authProvider.user != null) {
      List<Favorites> favs =
          await FavoritesService().getFavoritesByUserId(authProvider.user!.id);
      if (favs.isEmpty) {
        setState(() {
          _isLoading = false;
        });
      }
      List<Game> fetchedGames = [];

      for (Favorites fav in favs) {
        Game? game = await GameService().fetchGameById(fav.gameId);
        if (game != null) {
          fetchedGames.add(game);
        }
      }

      setState(() {
        games = fetchedGames;
        _isLoading = false;
      });
    }
  }

  void _refreshFavorites() {
    setState(() {
      _isLoading = true;
    });
    getFavoriteGames();
  }

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Favorites',
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 40,
                fontFamily: "AldotheApache",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : games.isEmpty
                ? const Center(
                    child: Text(
                    'No Favorites added yet.',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontFamily: "Gabarito",
                        fontWeight: FontWeight.bold),
                  ))
                : ListView.builder(
                    itemCount: games.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const GameDetailsPage()));
                              gameProvider.selectGame(games[index]);
                            },
                            child: Center(
                              child: FavoriteGameCard(
                                onRemove: _refreshFavorites,
                                gameId: games[index].id,
                                imageUrl: games[index].imageUrl,
                                title: games[index].title,
                                publisher: games[index].publisher,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
      ),
    );
  }
}
