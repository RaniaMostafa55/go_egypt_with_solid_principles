import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_egypt_with_firebase/features/favorites/firebase_model/favorites_firebase_model.dart';

class FavoriteFirebaseService {
  var db = FirebaseFirestore.instance;
  Future<List<FavoritePlace>> getFavoritePlaces() async {
    List<FavoritePlace> favorites = [];

    await db.collection("favorites").get().then((event) {
      for (var doc in event.docs) {
        favorites.add(FavoritePlace.fromFirestore(doc));
      }
    });

    return favorites;
  }
}
