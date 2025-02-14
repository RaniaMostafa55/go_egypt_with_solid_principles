import 'package:get_it/get_it.dart';
import 'data/datasources/governments_remote_data_source.dart';
import 'data/repositories/governments_repository_impl.dart';
import 'domain/repositories/governments_repository.dart';
import 'domain/usecases/get_governments.dart';
import 'presentation/bloc/governments_bloc.dart';

final sl = GetIt.instance;

void initGovernmentsDependencies() {
  // Bloc
  sl.registerFactory(() => GovernmentsBloc(getGovernments: sl()));
  
  // Use cases
  sl.registerLazySingleton(() => GetGovernments(sl()));
  
  // Repository
  sl.registerLazySingleton<GovernmentsRepository>(
    () => GovernmentsRepositoryImpl(remoteDataSource: sl()),
  );
  
  // Data sources
  sl.registerLazySingleton<GovernmentsRemoteDataSource>(
    () => GovernmentsRemoteDataSourceImpl(),
  );
}
