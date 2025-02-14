import 'package:go_egypt_with_firebase/features/home/models/place_model.dart';

class CardModel {
  String imagePath;

  String name;

  String enGovernmentName;
  String arGovernmentName;

  CardModel({
    required this.imagePath,
    required this.name,
    required this.enGovernmentName,
    required this.arGovernmentName,
  });

  static List<CardModel> cards = [
    CardModel(
      imagePath: PlaceModel.places[0].imagePath,
      name: PlaceModel.places[0].enName,
      enGovernmentName: 'Aswan',
      arGovernmentName: 'أسوان',
    ),
    CardModel(
      imagePath: PlaceModel.places[1].imagePath,
      name: PlaceModel.places[1].enName,
      enGovernmentName: 'Giza',
      arGovernmentName: 'الجيزة',
    ),
    CardModel(
      imagePath: PlaceModel.places[2].imagePath,
      name: PlaceModel.places[2].enName,
      enGovernmentName: 'Luxor',
      arGovernmentName: 'الأقصر',
    ),
    CardModel(
      imagePath: PlaceModel.places[3].imagePath,
      name: PlaceModel.places[3].enName,
      enGovernmentName: ' Aswan',
      arGovernmentName: 'أسوان',
    ),
    CardModel(
      imagePath: PlaceModel.places[4].imagePath,
      name: PlaceModel.places[4].enName,
      enGovernmentName: ' Alexandria',
      arGovernmentName: 'الإسكندرية',
    ),
  ];
}
