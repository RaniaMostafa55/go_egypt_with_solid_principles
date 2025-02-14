import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_firebase/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt_with_firebase/features/home/models/card_model.dart';
import 'package:go_egypt_with_firebase/features/home/widgets/place_item_widget.dart';

import '../models/place_model.dart';

class CardWidget extends StatefulWidget {
  final CardModel card;
  final PlaceModel place;
  const CardWidget({
    super.key,
    required this.card,
    required this.place,
  });
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _isFavorite = false;
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  void _checkIfFavorite() async {
    final query = await db
        .collection("favorites")
        .where("enName", isEqualTo: widget.place.enName)
        .get();

    if (mounted) {
      setState(() {
        _isFavorite = query.docs.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: BlocProvider.of<ThemeBloc>(context).darkMode
            ? Colors.grey.shade900
            : Colors.grey.shade300,
      ),
      child: Column(
        children: [
          PlaceItemWidget(
            place: widget.place,
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  isCurrentLocaleEnglish()
                      ? widget.card.enGovernmentName
                      : widget.card.arGovernmentName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    final previousState = _isFavorite;
                    setState(() => _isFavorite = !previousState);

                    try {
                      if (!previousState) {
                        await addToFavorites();
                      } else {
                        await removeFromFavorites();
                      }
                    } catch (e) {
                      if (mounted) {
                        setState(() => _isFavorite = previousState);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Operation failed: ${e.toString()}')),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.favorite_sharp,
                    color: _isFavorite
                        ? Theme.of(context).colorScheme.error
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addToFavorites() async {
    try {
      final data = {
        "enName": widget.place.enName,
        "arName": widget.place.arName,
        "image": widget.place.imagePath,
        "enGovernmentName": widget.card.enGovernmentName,
        "arGovernmentName": widget.card.arGovernmentName,
      };

      await db.collection("favorites").add(data);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Place added to favorites')),
        );
      }
    } catch (e) {
      print("Error adding to favorites: $e");
      if (mounted) {
        setState(() {
          _isFavorite = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add favorite')),
        );
      }
    }
  }

  Future<void> removeFromFavorites() async {
    try {
      final query = await db
          .collection("favorites")
          .where("enName", isEqualTo: widget.place.enName)
          .get();

      for (var doc in query.docs) {
        await db.collection("favorites").doc(doc.id).delete();
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Place removed from favorites')),
        );
      }
    } catch (e) {
      print("Error removing from favorites: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to remove favorite')),
        );
      }
    }
  }
}
