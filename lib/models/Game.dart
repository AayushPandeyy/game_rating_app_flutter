class Game {
  final String id;
  final String title;
  final String genre;
  final String developer;
  final DateTime releaseDate;
  final double rating;
  final String platform;
  final String description;
  final String os;
  final String processor;
  final String memory;
  final String graphics;
  final String price;
  final String publisher;
  final String imageUrl;
  final int totalRaters;

  Game(
      {required this.id,
      required this.title,
      required this.genre,
      required this.developer,
      required this.releaseDate,
      required this.rating,
      required this.platform,
      required this.description,
      required this.os,
      required this.processor,
      required this.memory,
      required this.graphics,
      required this.price,
      required this.publisher,
      required this.imageUrl,
      required this.totalRaters});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['_id'],
      title: json['title'],
      genre: json['genre'],
      developer: json['developer'],
      releaseDate: DateTime.parse(json['releaseDate']),
      rating: json['rating'].toDouble(),
      platform: json['platform'],
      description: json['description'],
      os: json['OS'],
      processor: json['Processor'],
      memory: json['Memory'],
      graphics: json['Graphics'],
      price: json['Price'],
      publisher: json['Publisher'],
      imageUrl: json['imageUrl'],
      totalRaters: json['totalRaters'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'genre': genre,
      'developer': developer,
      'releaseDate': releaseDate.toIso8601String(),
      'rating': rating,
      'platform': platform,
      'description': description,
      'OS': os,
      'Processor': processor,
      'Memory': memory,
      'Graphics': graphics,
      'Price': price,
      'Publisher': publisher,
      'imageUrl': imageUrl,
      'totalRaters': totalRaters
    };
  }
}
