import 'package:flutter/cupertino.dart';
import 'package:game_rating_app/models/Game.dart';
import 'package:game_rating_app/services/game_service.dart';

class GameProvider extends ChangeNotifier {
  final GameService gameService = GameService();
  List<Game> _games = [];

  List<Game> get games => _games;

  Game? _selectedGame;
  Game? get selectedGame => _selectedGame;

  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch all games
  Future<void> fetchGames() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _games = await gameService.fetchGames();
    } catch (e) {
      _errorMessage = 'Failed to load games: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch a single game by ID
  Future<void> fetchGameById(String id) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      Game game = await gameService.fetchGameById(id);
      _games = [game];
    } catch (e) {
      _errorMessage = 'Failed to load game: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add a new game
  Future<void> addGame(Game game) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      Game newGame = await gameService.createGame(game);
      _games.add(newGame);
    } catch (e) {
      _errorMessage = 'Failed to add game: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update an existing game
  Future<void> updateGame(String id, Game game) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      Game updatedGame = await gameService.updateGame(id, game);
      int index = _games.indexWhere((g) => g.id == id);
      if (index != -1) {
        _games[index] = updatedGame;
      }
    } catch (e) {
      _errorMessage = 'Failed to update game: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete a game
  Future<void> deleteGame(String id) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      await gameService.deleteGame(id);
      _games.removeWhere((g) => g.id == id);
    } catch (e) {
      _errorMessage = 'Failed to delete game: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectGame(Game game) {
    _selectedGame = game;
    notifyListeners();
  }
}
