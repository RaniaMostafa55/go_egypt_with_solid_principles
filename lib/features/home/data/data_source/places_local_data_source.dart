import 'package:go_egypt_with_firebase/features/home/domain/entities/place_entity.dart';

abstract class PlacesLocalDataSource {
  Future<List<PlaceEntity>> getPlaces();
}

class PlacesLocalDataSourceImpl implements PlacesLocalDataSource {
  @override
  Future<List<PlaceEntity>> getPlaces() async {
    return PlaceEntity.places;
  }
}
