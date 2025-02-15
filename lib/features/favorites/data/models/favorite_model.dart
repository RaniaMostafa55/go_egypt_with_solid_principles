import '../../domain/entities/favorite_place.dart';

class FavoriteModel extends FavoritePlace {
  const FavoriteModel({
    required super.enName,
    required super.arName,
    required super.image,
    required super.enGovernmentName,
    required super.arGovernmentName,
  });

  factory FavoriteModel.fromFirestore(Map<String, dynamic> data) {
    return FavoriteModel(
      enName: data['enName'] ?? '',
      arName: data['arName'] ?? '',
      image: data['image'] ?? '',
      enGovernmentName: data['enGovernmentName'] ?? '',
      arGovernmentName: data['arGovernmentName'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'enName': enName,
      'arName': arName,
      'image': image,
      'enGovernmentName': enGovernmentName,
      'arGovernmentName': arGovernmentName,
    };
  }
}
