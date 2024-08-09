import 'package:flutter/cupertino.dart';
import 'package:game_rating_app/models/Game.dart';

class GameProvider extends ChangeNotifier {
  final List<Game> _games = [
    Game(
      title: 'CyberPunk 2077',
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BMTc0NjYzYmUtYmIyZC00OThmLWJhYjctOWIyYjIxMzFjMTUwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg',
      description:
          'Immerse yourself in the Cyberpunk universe, from the original storyline of Cyberpunk 2077 and its gripping spy-thriller expansion Phantom Liberty to the award-winning anime series Cyberpunk: Edgerunners — there are countless stories to discover in the deadly megalopolis of Night City.',
      screenshotImageUrls: [
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png',
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png'
      ],
      systemRequirements: [
        'Requirement 1',
        'Requirement 2',
        'Requirement 3',
        'Requirement 4'
      ],
      date: "TBA 2022",
      totalRaters: 0,
      totalRating: 0,
    ),
    Game(
      title: 'The Wolf Among Us 2',
      imageUrl:
          'https://cloudgames.gg/wp-content/uploads/the-wolf-among-us-2-portrait.jpg',
      description:
          'Play as Bigby, “The Big Bad Wolf” and Sheriff of Fabletown, as you return to a gritty detective noir world where there are no fairy tale endings.The Wolf Among Us 2 picks up six months after the events of season one. It’s winter in New York City and a new case threatens to cross the line between Fabletown and the NYPD. How you choose to approach it could determine the future of the Fable community.Telltale’s The Wolf Among Us series is based upon the DC Comics series, Fables. ',
      screenshotImageUrls: [
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png',
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png'
      ],
      systemRequirements: [
        'Requirement 1',
        'Requirement 2',
        'Requirement 3',
        'Requirement 4'
      ],
      date: "TBA 2022",
      totalRaters: 0,
      totalRating: 0,
    ),
    Game(
      title: 'The Last Of Us 2',
      imageUrl:
          'https://static.wikia.nocookie.net/sony-playstation/images/4/4f/The_Last_of_Us_Part_II.png/revision/latest?cb=20200725073550',
      description:
          'Five years after their dangerous journey across the post-pandemic United States, Ellie and Joel have settled down in Jackson, Wyoming. Living amongst a thriving community of survivors has allowed them peace and stability, despite the constant threat of the infected and other, more desperate survivors.When a violent event disrupts that peace, Ellie embarks on a relentless journey to carry out justice and find closure. As she hunts those responsible one by one, she is confronted with the devastating physical and emotional repercussions of her actions.',
      screenshotImageUrls: [
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png',
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png'
      ],
      systemRequirements: [
        'Requirement 1',
        'Requirement 2',
        'Requirement 3',
        'Requirement 4'
      ],
      date: "TBA 2022",
      totalRaters: 0,
      totalRating: 0,
    ),
    Game(
      title: 'Grand Theft Auto VI',
      imageUrl:
          'https://images.thedirect.com/media/article_full/gta-6_oJXCNbs.jpg',
      description:
          'Grand Theft Auto VI heads to the state of Leonida, home to the neon-soaked streets of Vice City and beyond in the biggest, most immersive evolution of the Grand Theft Auto series yet. Coming 2025 to PlayStation 5 and Xbox Series X|S.',
      screenshotImageUrls: [
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png',
        'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Ghostrunner-empty-streets-with-badguy.png'
      ],
      systemRequirements: [
        'Requirement 1',
        'Requirement 2',
        'Requirement 3',
        'Requirement 4'
      ],
      date: "TBA 2022",
      totalRaters: 0,
      totalRating: 0,
    ),
    // Add more games as needed
  ];

  List<Game> get games => _games;

  Game? _selectedGame;
  Game? get selectedGame => _selectedGame;

  void selectGame(Game game) {
    _selectedGame = game;
    notifyListeners();
  }

  
}
