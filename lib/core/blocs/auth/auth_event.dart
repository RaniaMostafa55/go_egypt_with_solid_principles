part of 'auth_bloc.dart';

abstract class AuthEvent {}
class LoginRequested extends AuthEvent{
  String email;
  String password;
  LoginRequested({required this.email, required this.password});
}
class LogoutRequested extends AuthEvent{}

class SignupRequested extends AuthEvent{
  String username;
  String email;
  String password;
  String phone ;
  SignupRequested({required this.username, required this.email, required this.password, required this.phone});
}

