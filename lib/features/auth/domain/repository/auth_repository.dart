import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/entities/login_entity.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/entities/signup_entity.dart';

abstract class AuthRepository{
  Future<Either<Failure, UserCredential>> login(LoginEntity login);
  Future<Either<Failure, UserCredential>>signUp(SignUpEntity signUp);
  Future<Either<Failure,void>>logout();
}