import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/entities/login_entity.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase{
  AuthRepository repository ;
  LoginUseCase(this.repository);
  Future<Either<Failure,UserCredential>> execute(LoginEntity login)async{
    return await repository.login(login);
  }
}