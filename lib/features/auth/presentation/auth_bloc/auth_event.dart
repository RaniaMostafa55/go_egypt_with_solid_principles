import 'package:go_egypt_with_firebase/features/auth/domain/entities/login_entity.dart';
import 'package:go_egypt_with_firebase/features/auth/domain/entities/signup_entity.dart';

abstract class AuthEvent {}
class LoginRequested extends AuthEvent{
 LoginEntity loginEntity;
  LoginRequested({required this.loginEntity});
}
class LogoutRequested extends AuthEvent{}

class SignupRequested extends AuthEvent{
  SignUpEntity signUpEntity ;
  SignupRequested( {required this.signUpEntity});
}

