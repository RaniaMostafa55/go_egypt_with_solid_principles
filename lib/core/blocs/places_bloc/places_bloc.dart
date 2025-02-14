import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/features/home/models/place_model.dart';
import 'places_event.dart';
import 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesBloc() : super(PlacesInitial()) {
    on<LoadPlaces>(_onLoadPlaces);
    on<LoadMorePlaces>(_onLoadMorePlaces);
  }

  void _onLoadPlaces(LoadPlaces event, Emitter<PlacesState> emit) async {
    emit(PlacesLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(PlacesLoaded(PlaceModel.places));
    } catch (e) {
      emit(PlacesError('Failed to load places'));
    }
  }

  void _onLoadMorePlaces(
      LoadMorePlaces event, Emitter<PlacesState> emit) async {
    final currentState = state;
    if (currentState is PlacesLoaded) {
      try {
        await Future.delayed(const Duration(seconds: 2));
        final newPlaces = [
          ...currentState.places,
          ...PlaceModel.places,
        ];
        emit(PlacesLoaded(newPlaces));
      } catch (e) {
        emit(PlacesError('Failed to load more places'));
      }
    }
  }
}
