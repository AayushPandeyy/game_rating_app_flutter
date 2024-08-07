class Game {
  final String title;
  final String imageUrl;
  final String description;
  final List<String> screenshotImageUrls;
  final List<String> systemRequirements;
  final String date;

  Game({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.screenshotImageUrls,
    required this.systemRequirements,
    required this.date
  });
}
