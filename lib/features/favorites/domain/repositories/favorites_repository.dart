import 'package:go_egypt_with_firebase/features/favorites/domain/entities/favorite_place.dart';

abstract class FavoritesRepository {
  Future<List<FavoritePlace>> getFavorites();
}
