import 'package:go_egypt_with_firebase/features/home/domain/entities/card_entity.dart';
import 'package:go_egypt_with_firebase/features/home/domain/entities/place_entity.dart';

abstract class PlacesState {}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoaded extends PlacesState {
  final List<PlaceEntity> places;
  final List<CardEntity> cards;
  PlacesLoaded(this.places, this.cards);
}

class PlacesError extends PlacesState {
  final String message;
  PlacesError(this.message);
}
