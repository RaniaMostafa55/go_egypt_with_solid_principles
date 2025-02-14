import 'package:dartz/dartz.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/home/domain/entities/place_entity.dart';

abstract class PlacesRepository {
  Future<Either<Failure, List<PlaceEntity>>> getPlaces();
}
