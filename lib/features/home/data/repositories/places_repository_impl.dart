import 'package:dartz/dartz.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/home/data/data_source/places_local_data_source.dart';
import 'package:go_egypt_with_firebase/features/home/domain/entities/place_entity.dart';
import 'package:go_egypt_with_firebase/features/home/domain/repositories/places_repositories.dart';

class PlacesRepositoryImplementation implements PlacesRepository {
  PlacesRepositoryImplementation({required this.placesLocalDataSource});

  final PlacesLocalDataSource placesLocalDataSource;

  @override
  Future<Either<Failure, List<PlaceEntity>>> getPlaces() async {
    try {
      final places = await placesLocalDataSource.getPlaces();
      return Right(places);
    } catch (e) {
      return Left(Failure('Failed to fetch products'));
    }
  }
}
