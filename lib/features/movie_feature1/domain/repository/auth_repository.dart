import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<void> signInwithEmail(String email,String password);
  Future<void> signUpwithEmail(String email,String password);
  Future<void> signOut();
}