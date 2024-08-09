import 'package:flutter/material.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class RatingDialog {
  double _currentRating = 1;

  void showRatingDialog(BuildContext context) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.custom,
        confirmBtnText: "Rate",
        title: "Rate game",
        customAsset: "assets/images/game_logo.jpg",
        
        widget: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                return const Icon(
                  Icons.star,
                  color: Colors.pink,
                  // color: getColor(),
                );
              }),
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return Slider(
                  value: _currentRating,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: _currentRating.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentRating = value;
                    });
                  },
                );
              },
            ),
          ],
        ));
  }
}
