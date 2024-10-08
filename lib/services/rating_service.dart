import 'dart:convert';
import 'package:game_rating_app/models/Rating.dart';
import 'package:http/http.dart' as http;

class RatingService {
  final String baseUrl = 'http://192.168.1.124:8081/api/rating';

  // Fetch ratings by game ID
  Future<List<Rating>> getRatingsByGameId(String gameId) async {
    final url = "$baseUrl/gid/${gameId}";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      if (data.isNotEmpty) {
        List<Rating> ratings =
            data.map((dynamic item) => Rating.fromJson(item)).toList();
        return ratings;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load ratings');
    }
  }

  // Post a new rating
  Future<void> postRating(String title, String content, int starRating,
      String author, String gameId, String userId) async {
    final url = Uri.parse(baseUrl);
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "title": title,
      "content": content,
      "starRating": starRating,
      "author": author,
      "game_id": gameId,
      "user_id": userId
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode != 201) {
      throw Exception('Failed to post rating');
    }
  }

  // Fetch all ratings
  Future<List<Rating>> getAllRatings() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Rating> ratings =
          data.map((dynamic item) => Rating.fromJson(item)).toList();
      return ratings;
    } else {
      throw Exception('Failed to load ratings');
    }
  }

  Future<void> updateRating(String id, Map<String, dynamic> ratingData) async {
    final url = Uri.parse("$baseUrl/$id");
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(ratingData);

    final response = await http.patch(url, headers: headers, body: body);

    print(response.body);

    if (response.statusCode != 201) {
      throw Exception('Failed to update rating');
    }
  }
}
