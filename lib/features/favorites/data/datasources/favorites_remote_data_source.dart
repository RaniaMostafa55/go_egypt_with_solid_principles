import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_egypt_with_firebase/features/favorites/data/models/favorite_model.dart';

import '../../domain/entities/favorite_place.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<FavoritePlace>> getFavorites();
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final FirebaseFirestore firestore;

  FavoritesRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<FavoritePlace>> getFavorites() async {
    final snapshot = await firestore.collection("favorites").get();
    return snapshot.docs.map((doc) {
      return FavoriteModel.fromFirestore(doc.data());
    }).toList();
  }
}
