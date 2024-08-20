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

  Future<Game> updateGameRating(String gameId, double newRating) async {
    try {
      // API URL for updating the game rating
      final url = Uri.parse('$baseUrl/rating/$gameId');

      // Create the request body
      final body = jsonEncode({'newRating': newRating});

      // Send the PATCH request
      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print('Rating updated successfully.');

        // Decode the response body and return the updated Game object
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return Game.fromJson(
            responseData); // Assuming Game has a fromJson constructor
      } else {
        print('Failed to update rating. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to update rating');
      }
    } catch (e) {
      print('Error updating rating: $e');
      throw e;
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
