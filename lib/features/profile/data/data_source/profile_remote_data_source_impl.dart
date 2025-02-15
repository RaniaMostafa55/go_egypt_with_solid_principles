import '../models/profile_model.dart';
import 'profile_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ProfileRemoteDataSourceImpl({
    required this.firestore,
    required this.auth,
  });

  @override
  Future<ProfileModel> getProfile() async {
    final user = auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    final doc = await firestore.collection('users').doc(user.uid).get();
    if (!doc.exists) {
      throw Exception('User profile not found');
    }

    return ProfileModel.fromJson(doc.data()!);
  }

  @override
  Future<void> updateProfile(ProfileModel profile) async {
    final user = auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    await firestore.collection('users').doc(user.uid).update(profile.toJson());
  }

  @override
  Future<void> updateProfileImage(String imagePath) async {
    final user = auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    await firestore.collection('users').doc(user.uid).update({
      'imagePath': imagePath,
    });
  }
}
