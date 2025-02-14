import 'package:dartz/dartz.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/home/domain/entities/card_entity.dart';

abstract class CardsRepository {
  Future<Either<Failure, List<CardEntity>>> getCards();
}
