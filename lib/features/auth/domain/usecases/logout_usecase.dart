import 'package:dartz/dartz.dart';
import 'package:go_egypt_with_firebase/core/failures.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/repository/auth_repository.dart';

class LogoutUseCase{
  AuthRepository authRepository ;
  LogoutUseCase(this.authRepository);

  Future<Either<Failure,void>> execute()async{
    return await authRepository.logout();
  }
}