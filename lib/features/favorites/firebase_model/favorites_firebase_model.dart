import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritePlace {
  final String? enName;
  final String? arName;
  final String? image;
  final String? enGovernmentName;
  final String? arGovernmentName;

  FavoritePlace({
    this.enName,
    this.arName,
    this.image,
    this.enGovernmentName,
    this.arGovernmentName,
  });

  factory FavoritePlace.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return FavoritePlace(
      enName: data?['enName'],
      arName: data?['arName'],
      image: data?['image'],
      enGovernmentName: data?['enGovernmentName'],
      arGovernmentName: data?['arGovernmentName'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (enName != null) "enName": enName,
      if (arName != null) "arName": arName,
      if (image != null) "image": image,
      if (enGovernmentName != null) "enGovernmentName": enGovernmentName,
      if (arGovernmentName != null) "arGovernmentName": arGovernmentName,
    };
  }
}