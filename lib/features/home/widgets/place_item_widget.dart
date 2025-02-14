import 'package:flutter/material.dart';
import 'package:go_egypt_with_firebase/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt_with_firebase/features/home/models/place_model.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlaceModel place;
  const PlaceItemWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              place.imagePath,
              width: screenWidth * 0.8,
              height: screenHeight * 0.24,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            isCurrentLocaleEnglish() ? place.enName : place.arName,
            style: const TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
