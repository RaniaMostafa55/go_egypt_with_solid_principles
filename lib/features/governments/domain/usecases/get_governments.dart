import '../repositories/governments_repository.dart';
import '../entities/government.dart';

class GetGovernments {
  final GovernmentsRepository repository;

  GetGovernments(this.repository);

  Future<List<Government>> call() async {
    return await repository.getGovernments();
  }
}
