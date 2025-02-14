import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/helpers/shared_pref_helper.dart';
import 'package:go_egypt_with_firebase/features/auth/user-profile.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(AuthAuthenticated());
      } catch (e) {
        emit(AuthError(message: 'Error when authenticated ${e.toString()}'));
      }
    });
    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(AuthUnauthenticated());
      } catch (e) {
        emit(AuthError(message: 'Error when unauthenticated ${e.toString()}'));
      }
    });
    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(AuthAuthenticated());
      } catch (e) {
        emit(AuthError(message: 'Error when SignUp ${e.toString()}'));
      }
    });
  }
  void signUp(
      {required String username,
      required String emailAddress,
      required String password,
      required String phone,
      context}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      add(SignupRequested(
          username: username,
          email: emailAddress,
          password: password,
          phone: phone));
      // to add user to database.
      var db = FirebaseFirestore.instance;
      var user = UserProfile(
          name: username,
          email: emailAddress,
          password: password,
          phone: phone);
      db.collection('users').add(user.toFireStore());
      await SharedPrefHelper.setData('email', emailAddress);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Theme.of(context).colorScheme.error,
      ));
    }
  }

  void login(
      {required String emailAddress, required String password, context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      add(LoginRequested(email: emailAddress, password: password));
      await SharedPrefHelper.setData('email', emailAddress);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Theme.of(context).colorScheme.error,
      ));
    }
  }
}
