// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_firebase/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt_with_firebase/features/governments/domain/entities/government.dart';
import 'package:go_egypt_with_firebase/features/governments/presentation/views/government_details_view.dart';

class GovernmentCardItem extends StatelessWidget {
  const GovernmentCardItem({
    super.key,
    required this.government,
  });

  final Government government;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GovernmentDetailsView(
              tagName: government.enName,
              image: government.image,
              arName: government.arName,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: BlocProvider.of<ThemeBloc>(context).darkMode
                ? Colors.grey.shade900
                : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: BlocProvider.of<ThemeBloc>(context).darkMode
                    ? Colors.black
                    : Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Hero(
                tag: government.enName,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: government.image,
                      width: 150,
                      height: 130,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  isCurrentLocaleEnglish()
                      ? government.enName
                      : government.arName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
