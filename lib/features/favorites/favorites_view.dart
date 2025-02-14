// filepath: /c:/Users/omara/OneDrive/Documents/Flutter/Flutter Projects/sprints/Go-Egypt/lib/features/favorites/favorites_view.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_firebase/core/helpers/is_current_locale_english.dart';
import 'package:go_egypt_with_firebase/features/favorites/firebase_model/favorites_firebase_model.dart';
import 'package:go_egypt_with_firebase/features/favorites/firebase_service/favorite_firebase_service.dart';
import 'package:go_egypt_with_firebase/generated/l10n.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List<FavoritePlace> places = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavoritePlaces();
  }

  getFavoritePlaces() async {
    var favorites = await FavoriteFirebaseService().getFavoritePlaces();
    setState(() {
      places = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).favorites,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: places.length,
                itemBuilder: (BuildContext context, int index) {
                  // final landmark = LandmarksModel.landmarks[index];
                  final place = places[index];
                  return Card(
                    color: BlocProvider.of<ThemeBloc>(context).darkMode
                        ? Colors.grey.shade900
                        : Colors.white,
                    elevation: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: place.image!,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            isCurrentLocaleEnglish()
                                ? place.enName!
                                : place.arName!,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            isCurrentLocaleEnglish()
                                ? place.enGovernmentName!
                                : place.arGovernmentName!,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
