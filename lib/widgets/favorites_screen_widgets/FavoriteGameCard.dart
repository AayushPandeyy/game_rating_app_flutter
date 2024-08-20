import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/services/favorites_service.dart';
import 'package:quickalert/quickalert.dart';

class FavoriteGameCard extends StatefulWidget {
  final String gameId;
  final String imageUrl;
  final String title;
  final String developer;
  final VoidCallback onRemove;

  const FavoriteGameCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.gameId,
    required this.onRemove,
    required this.developer,
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
            border: Border.all(color: Colors.red)),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(widget.imageUrl),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  AutoSizeText(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red),
                  ),
                  AutoSizeText(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    widget.developer,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
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
                    color: Colors.pink,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.pink,
                )
              ],
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 153, 2, 2),
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
                        widget.onRemove();
                        Navigator.pop(context);
                      });
                },
                icon: const Icon(Icons.favorite, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
