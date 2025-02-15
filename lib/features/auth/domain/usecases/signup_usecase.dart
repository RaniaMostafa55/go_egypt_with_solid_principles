import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/entities/signup_entity.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/repository/auth_repository.dart';

class SignUpUseCase{
  AuthRepository repository ;
  SignUpUseCase(this.repository);

  Future<Either<Failure,UserCredential>> signUp(SignUpEntity signUp)async{
    return await repository.signUp(signUp);
  }
}