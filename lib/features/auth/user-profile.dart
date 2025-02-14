import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String? path;
  String name;
  String email;
  String password;
  String phone;
  UserProfile(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone,
      this.path});

  factory UserProfile.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return UserProfile(
      name: data?['name']??'',
      email: data?['email']??"",
      password: data?['password']??'',
      phone: data?['phone']??"",

    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (name != null) "name": name,
      if (phone != null) "phone": phone,
      if (email != null) "email": email,
      if (password != null) "password": password
    };
  }

}
