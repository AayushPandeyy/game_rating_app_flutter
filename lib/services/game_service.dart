import 'dart:convert';

import 'package:game_rating_app/models/Game.dart';
import 'package:http/http.dart' as http;

class GameService {
  final String baseUrl = "http://192.168.1.124:8081/api/game";
  // Fetch all games
  Future<List<Game>> fetchGames() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Game> games =
          body.map((dynamic item) => Game.fromJson(item)).toList();
      return games;
    } else {
      throw Exception('Failed to load games');
    }
  }

  // Fetch a single game by ID
  Future<Game> fetchGameById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Game.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load game');
    }
  }

  // Create a new game
  Future<Game> createGame(Game game) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(game.toJson()),
    );

    if (response.statusCode == 201) {
      return Game.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create game');
    }
  }

  // Update an existing game
  Future<Game> updateGame(String id, Game game) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(game.toJson()),
    );

    if (response.statusCode == 200) {
      return Game.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update game');
    }
  }

  // Delete a game
  Future<void> deleteGame(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete game');
    }
  }
}
