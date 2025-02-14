import 'package:dartz/dartz.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/home/domain/entities/place_entity.dart';
import 'package:go_egypt_with_firebase/features/home/domain/repositories/places_repositories.dart';

class GetPlacesUseCase {
  GetPlacesUseCase({required this.placesRepository});

  final PlacesRepository placesRepository;

  Future<Either<Failure, List<PlaceEntity>>> call() async {
    return placesRepository.getPlaces();
  }
}
