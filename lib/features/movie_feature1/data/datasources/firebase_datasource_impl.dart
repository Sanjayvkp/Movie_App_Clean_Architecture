import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  Future<void> verifyEmail() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      throw SignUpException('Cannot login', 'try again');
    }
  }

  @override
  Future<void> signout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}

@riverpod
FirebaseAuthentication firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuthimpl(FirebaseAuth.instance);
}
