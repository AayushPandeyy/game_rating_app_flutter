import 'dart:convert';

import 'package:game_rating_app/models/Favorites.dart';
import 'package:http/http.dart' as http;

class FavoritesService {
  final String baseUrl = 'http://192.168.1.117:8081/api/favorites';
  Future<void> addFavorites(Map<String, dynamic> fav) async {
    final url = Uri.parse(baseUrl);

    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(fav);

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode != 201) {
      throw Exception('Failed to add favorites');
    }
  }

  Future<List<Favorites>> getFavoritesByUserId(String uid) async {
    final url = Uri.parse("$baseUrl/uid/$uid");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        List<Favorites> favorites =
            data.map((dynamic item) => Favorites.fromJson(item)).toList();
        return favorites;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<void> removeFavorite(String gid) async {
    final response = await http.delete(Uri.parse('$baseUrl/gid/$gid'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete game');
    }
  }
}
