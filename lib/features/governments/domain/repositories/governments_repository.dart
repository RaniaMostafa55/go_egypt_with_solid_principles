import '../entities/government.dart';

abstract class GovernmentsRepository {
  Future<List<Government>> getGovernments();
}
