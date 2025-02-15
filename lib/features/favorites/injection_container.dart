import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data/datasources/favorites_remote_data_source.dart';
import 'data/repositories/favorites_repository_impl.dart';
import 'domain/repositories/favorites_repository.dart';
import 'domain/usecases/get_favorites.dart';
import 'presentation/bloc/favorites_bloc.dart';

void initFavoritesDependencies() {
  final sl = GetIt.instance;
  
  // Bloc
  sl.registerFactory(() => FavoritesBloc(getFavorites: sl()));
  
  // Use cases
  sl.registerLazySingleton(() => GetFavorites(sl()));
  
  // Repository
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(remoteDataSource: sl()),
  );
  
  // Data sources
  sl.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(firestore: sl()),
  );
  
  // Firebase
  if (!sl.isRegistered<FirebaseFirestore>()) {
    sl.registerLazySingleton(() => FirebaseFirestore.instance);
  }
}
