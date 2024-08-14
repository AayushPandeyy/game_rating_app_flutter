import 'package:flutter/material.dart';
import 'package:game_rating_app/models/Rating.dart';
import 'package:game_rating_app/services/rating_service.dart';

class RatingProvider extends ChangeNotifier {
  final RatingService ratingService = RatingService();
  List<Rating> _ratings = [];

  List<Rating> get ratings => _ratings;

  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchRatingByGameId(String gameId) async {
    _ratings = [];
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    try {
      _ratings = await ratingService.getRatingsByGameId(gameId);
    } catch (e) {
      _errorMessage = 'Failed to load games: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
