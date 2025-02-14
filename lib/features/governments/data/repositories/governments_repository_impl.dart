import '../../domain/repositories/governments_repository.dart';
import '../../domain/entities/government.dart';
import '../datasources/governments_remote_data_source.dart';

class GovernmentsRepositoryImpl implements GovernmentsRepository {
  final GovernmentsRemoteDataSource remoteDataSource;

  GovernmentsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Government>> getGovernments() async {
    return await remoteDataSource.getGovernments();
  }
}
