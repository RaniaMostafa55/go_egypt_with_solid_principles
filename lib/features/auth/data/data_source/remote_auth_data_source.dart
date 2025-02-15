import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_egypt_with_firebase/core/helpers/shared_pref_helper.dart';
import 'package:go_egypt_with_firebase/features/auth/data/models/login_model.dart';
import 'package:go_egypt_with_firebase/features/auth/data/models/signup_model.dart';

abstract class RemoteAuthDataSource{
  Future<UserCredential> signUp(SignUpModel signUp);
  Future<UserCredential> login(LoginModel signIn);
  Future<void> logout();
}
final FirebaseAuth _auth = FirebaseAuth.instance ;
FirebaseFirestore _store = FirebaseFirestore.instance;
class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {

  @override
  Future<UserCredential> signUp(SignUpModel signUp) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: signUp.email, password: signUp.password);
      _store.collection('users').doc().set(signUp.toFireStore());
      await SharedPrefHelper.setData('email', signUp.email);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        throw (e.message ?? 'Sign up failed');
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<UserCredential> login(LoginModel login) async {
    try {
      await SharedPrefHelper.setData('email', login.email);

      return await _auth.signInWithEmailAndPassword(
          email: login.email, password: login.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw 'The supplied auth credential is incorrect, malformed or has expired.';
      } else {
        throw (e.message ??'LoginFailed');
      }
    } catch (e) {
      throw (e.toString());
    }
  }
  Future<void> logout()async{
    try {
      await _auth.signOut();
    } catch (e) {
      throw (e.toString());
    }
  }
  }

