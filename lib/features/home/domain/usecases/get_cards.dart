import 'package:dartz/dartz.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/home/domain/entities/card_entity.dart';
import 'package:go_egypt_with_firebase/features/home/domain/repositories/cards_repositories.dart';

class GetCardsUseCase {
  GetCardsUseCase({required this.cardsRepository});

  final CardsRepository cardsRepository;

  Future<Either<Failure, List<CardEntity>>> call() async {
    return cardsRepository.getCards();
  }
}
