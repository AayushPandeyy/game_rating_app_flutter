// ignore_for_file: public_member_api_docs, sort_constructors_first
class Rating {
  final String id;
  final String title;
  final String author;
  final String content;
  final String userId;
  final String gameId;
  final int starRating;

  Rating({
    required this.id,
    required this.title,
    required this.author,
    required this.content,
    required this.userId,
    required this.gameId,
    required this.starRating,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['_id'],
      title: json['title'],
      author: json['author'],
      content: json['content'],
      userId: json['user_id'],
      gameId: json['game_id'],
      starRating: json['starRating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'content': content,
      'user_id': userId,
      'game_id': gameId,
      'starRating': starRating
    };
  }
}
