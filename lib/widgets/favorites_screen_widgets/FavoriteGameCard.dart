import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_rating_app/services/favorites_service.dart';
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
    required this.gameId,
    required this.onRemove,
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
          color: Color.fromARGB(255, 255, 223, 223), // Adjust color as needed
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image(
              image: NetworkImage(widget.imageUrl),
              height: 50,
              width: 50,
              fit: BoxFit.contain,
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
                icon: const Icon(Icons.delete, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
