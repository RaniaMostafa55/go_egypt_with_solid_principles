// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_firebase/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt_with_firebase/features/governments/models/landmarks_model.dart';

class LandmarkCardItem extends StatelessWidget {
  const LandmarkCardItem({
    super.key,
    required this.landmark,
  });

  final LandmarksModel landmark;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: BlocProvider.of<ThemeBloc>(context).darkMode
            ? Colors.grey.shade900
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: BlocProvider.of<ThemeBloc>(context).darkMode
                ? Colors.black
                : Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left:
                  isCurrentLocaleEnglish() ? Radius.circular(12) : Radius.zero,
              right:
                  isCurrentLocaleEnglish() ? Radius.zero : Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: landmark.image,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                isCurrentLocaleEnglish() ? landmark.enName : landmark.arName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
