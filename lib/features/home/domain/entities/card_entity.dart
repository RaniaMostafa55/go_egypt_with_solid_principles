import 'package:go_egypt_with_firebase/features/home/domain/entities/place_entity.dart';

class CardEntity {
  String imagePath;
  String name;
  String enGovernmentName;
  String arGovernmentName;

  CardEntity({
    required this.imagePath,
    required this.name,
    required this.enGovernmentName,
    required this.arGovernmentName,
  });

  static List<CardEntity> cards = [
    CardEntity(
      imagePath: PlaceEntity.places[0].imagePath,
      name: PlaceEntity.places[0].enName,
      enGovernmentName: 'Aswan',
      arGovernmentName: 'أسوان',
    ),
    CardEntity(
      imagePath: PlaceEntity.places[1].imagePath,
      name: PlaceEntity.places[1].enName,
      enGovernmentName: 'Giza',
      arGovernmentName: 'الجيزة',
    ),
    CardEntity(
      imagePath: PlaceEntity.places[2].imagePath,
      name: PlaceEntity.places[2].enName,
      enGovernmentName: 'Luxor',
      arGovernmentName: 'الأقصر',
    ),
    CardEntity(
      imagePath: PlaceEntity.places[3].imagePath,
      name: PlaceEntity.places[3].enName,
      enGovernmentName: ' Aswan',
      arGovernmentName: 'أسوان',
    ),
    CardEntity(
      imagePath: PlaceEntity.places[4].imagePath,
      name: PlaceEntity.places[4].enName,
      enGovernmentName: ' Alexandria',
      arGovernmentName: 'الإسكندرية',
    ),
  ];
}
