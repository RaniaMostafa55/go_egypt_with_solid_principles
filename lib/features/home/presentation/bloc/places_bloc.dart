import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/features/home/domain/usecases/get_cards.dart';
import 'package:go_egypt_with_firebase/features/home/domain/usecases/get_places.dart';
import 'places_event.dart';
import 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final GetPlacesUseCase getPlacesUseCase;
  final GetCardsUseCase getCardsUseCase;
  PlacesBloc({required this.getPlacesUseCase, required this.getCardsUseCase})
      : super(PlacesInitial()) {
    on<LoadPlaces>(_onLoadPlaces);
  }

  Future<void> _onLoadPlaces(
      LoadPlaces event, Emitter<PlacesState> emit) async {
    emit(PlacesLoading());

    await Future.delayed(const Duration(seconds: 2));

    final placesResult = await getPlacesUseCase();
    final cardsResult = await getCardsUseCase();

    placesResult.fold(
      (failure) => emit(PlacesError(failure.message)),
      (places) {
        cardsResult.fold((failure) => emit(PlacesError(failure.message)),
            (cards) => emit(PlacesLoaded(places, cards)));
      },
    );
  }
}
