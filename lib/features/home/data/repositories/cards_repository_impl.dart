import 'package:dartz/dartz.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/home/data/data_source/cards_local_data_source.dart';
import 'package:go_egypt_with_firebase/features/home/domain/entities/card_entity.dart';
import 'package:go_egypt_with_firebase/features/home/domain/repositories/cards_repositories.dart';

class CardsRepositoryImplementation implements CardsRepository {
  CardsRepositoryImplementation({required this.cardsLocalDataSource});

  final CardsLocalDataSource cardsLocalDataSource;

  @override
  Future<Either<Failure, List<CardEntity>>> getCards() async {
    try {
      final cards = await cardsLocalDataSource.getCards();
      return Right(cards);
    } catch (e) {
      return Left(Failure('Failed to fetch products'));
    }
  }
}
