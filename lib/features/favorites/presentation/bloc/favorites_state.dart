import '../../domain/entities/favorite_place.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<FavoritePlace> favorites;
  FavoritesLoaded(this.favorites);
}

class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError(this.message);
}
