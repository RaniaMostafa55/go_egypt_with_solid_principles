import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:go_egypt_with_firebase/features/auth/data/models/login_model.dart';
import 'package:go_egypt_with_firebase/features/auth/data/models/signup_model.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/entities/login_entity.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/entities/signup_entity.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  RemoteAuthDataSource authDataSource ;
  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<Failure, UserCredential>> login(LoginEntity login) async{
    try{
      var user =LoginModel(email: login.email, password: login.password);
     var userCredential = await authDataSource.login(user);
      return Right(userCredential);
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUp(SignUpEntity signUp) async{
    try{
      var user = SignUpModel(name:signUp.name,email: signUp.email, password: signUp.password,phone: signUp.phone);
      var userCredential = await authDataSource.signUp(user);
      return Right(userCredential);
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async{
  try{
    await authDataSource.logout();
    return Right('Sucessfully logged out');
  }catch(e){
    return Left(Failure(e.toString()));
  }
  }

}