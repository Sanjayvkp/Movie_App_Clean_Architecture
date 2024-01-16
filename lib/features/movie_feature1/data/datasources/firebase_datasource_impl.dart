import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_application/core/exception/authentication/signin_exception.dart';
import 'package:movie_application/core/exception/authentication/signup_exception.dart';
import 'package:movie_application/features/movie_feature1/data/datasources/firebase_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_datasource_impl.g.dart';

class FirebaseAuthimpl implements FirebaseAuthentication {
  final FirebaseAuth _auth;
  FirebaseAuthimpl(this._auth);

  @override
  Future<void> signupEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw SignUpException('Password is weak', 'weak password');
      } else if (e.code == 'email-already-in-use') {
        throw SignUpException(
            'The account already exixsts', 'account already exists');
      }
    }
  }

  @override
  Future<void> signinEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw SigninException('cannot login', 'user not found');
      } else if (e.code == 'wrong-password') {
        throw SigninException('cannot login', 'wrong password');
      } else if (e.code == 'user-disabled') {
        throw SigninException('cannot login', 'user is disabled');
      }
    }
  }

  @override
  Future<void> signout() async {
    return _auth.signOut();
  }
}

@riverpod
FirebaseAuthentication firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuthimpl(FirebaseAuth.instance);
}
