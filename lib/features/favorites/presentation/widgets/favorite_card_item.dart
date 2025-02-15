import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/favorite_place.dart';

class FavoriteCardItem extends StatelessWidget {
  final FavoritePlace place;

  const FavoriteCardItem({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: place.image,
              fit: BoxFit.cover,
              placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Localizations.localeOf(context).languageCode == 'en' 
                  ? place.enName 
                  : place.arName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Text(
            Localizations.localeOf(context).languageCode == 'en'
                ? place.enGovernmentName
                : place.arGovernmentName,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
