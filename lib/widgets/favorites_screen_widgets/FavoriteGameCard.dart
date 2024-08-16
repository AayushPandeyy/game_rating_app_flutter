import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/providers/GameProvider.dart';
import 'package:game_rating_app/services/favorites_service.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class FavoriteGameCard extends StatefulWidget {
  final String gameId;
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onRemove;

  const FavoriteGameCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.gameId, required this.onRemove,
  });

  @override
  State<FavoriteGameCard> createState() => _FavoriteGameCardState();
}

class _FavoriteGameCardState extends State<FavoriteGameCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.pink, // Adjust color as needed
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image(
              image: NetworkImage(widget.imageUrl),
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AutoSizeText(
                maxLines: 2,
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Row(
              children: const [
                Text(
                  '4',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.star)
              ],
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                onPressed: () {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      title: "Remove from favorites?",
                      text:
                          "Are you sure you want to remove ${widget.title} from the favorites?",
                      confirmBtnText: "Remove",
                      onConfirmBtnTap: () async {
                        await FavoritesService().removeFavorite(widget.gameId);
                        widget.onRemove;
                        Navigator.pop(context);
                      });
                },
                icon: const Icon(Icons.delete, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
