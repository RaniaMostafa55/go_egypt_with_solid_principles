import 'package:go_egypt_with_firebase/features/auth/domain/entities/signup_entity.dart';

class SignUpModel extends SignUpEntity{
  SignUpModel({required super.name, required super.email, required super.password, required super.phone});

  factory SignUpModel.fromFireStore(Map<String,dynamic> json){
    return SignUpModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
    );
  }
  Map<String,dynamic> toFireStore(){
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}