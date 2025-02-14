import '../../domain/entities/government.dart';
import '../models/government_model.dart';

abstract class GovernmentsRemoteDataSource {
  Future<List<Government>> getGovernments();
}

class GovernmentsRemoteDataSourceImpl implements GovernmentsRemoteDataSource {
  @override
  Future<List<Government>> getGovernments() async {
    await Future.delayed(const Duration(seconds: 2));
    return GovernmentModel.fromStaticData();
  }
}
