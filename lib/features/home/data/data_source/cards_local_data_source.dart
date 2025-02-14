import 'package:go_egypt_with_firebase/features/home/domain/entities/card_entity.dart';

abstract class CardsLocalDataSource {
  Future<List<CardEntity>> getCards();
}

class CardsLocalDataSourceImpl implements CardsLocalDataSource {
  @override
  Future<List<CardEntity>> getCards() async {
    return CardEntity.cards;
  }
}
