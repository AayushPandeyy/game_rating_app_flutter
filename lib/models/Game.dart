class Game {
  final String title;
  final String imageUrl;
  final String description;
  final List<String> screenshotImageUrls;
  final List<String> systemRequirements;
  final String date;
  late final int totalRating;
  final int totalRaters;

  Game({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.screenshotImageUrls,
    required this.systemRequirements,
    required this.date,
    required this.totalRating,
    required this.totalRaters,
  });

  double getFinalRating() {
    return (totalRating / totalRaters);
  }

  void setRating(int rating){
    totalRating+=rating;
  }
}
