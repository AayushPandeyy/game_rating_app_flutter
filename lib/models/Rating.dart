class Rating {
  final String title;
  final String author;
  final String content;
  final String userId;
  final String gameId;

  Rating({
    required this.title,
    required this.author,
    required this.content,
    required this.userId,
    required this.gameId,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      title: json['title'],
      author: json['author'],
      content: json['content'],
      userId: json['user_id'],
      gameId: json['game_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'content': content,
      'user_id': userId,
      'game_id': gameId,
    };
  }
}
