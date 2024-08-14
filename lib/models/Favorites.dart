class Favorites {
  final String userId;
  final String gameId;

  Favorites({
    required this.userId,
    required this.gameId,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) {
    return Favorites(
      userId: json['user_id'],
      gameId: json['game_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'game_id': gameId,
    };
  }
}
