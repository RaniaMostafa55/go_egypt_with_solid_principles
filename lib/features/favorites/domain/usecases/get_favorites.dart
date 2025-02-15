import 'package:go_egypt_with_firebase/features/favorites/domain/entities/favorite_place.dart';

import '../repositories/favorites_repository.dart';

class GetFavorites {
  final FavoritesRepository repository;

  GetFavorites(this.repository);

  Future<List<FavoritePlace>> call() async {
    return await repository.getFavorites();
  }
}
