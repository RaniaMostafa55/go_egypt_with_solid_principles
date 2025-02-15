import '../../domain/repositories/favorites_repository.dart';
import '../../domain/entities/favorite_place.dart';
import '../datasources/favorites_remote_data_source.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<FavoritePlace>> getFavorites() async {
    return await remoteDataSource.getFavorites();
  }
}
