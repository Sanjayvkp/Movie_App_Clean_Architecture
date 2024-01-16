import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_application/core/exception/authentication/invalid_credential_exception.dart';
import 'package:movie_application/core/exception/authentication/signup_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class SignUpUseCase {
  final AuthenticationRepository repository;
  SignUpUseCase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.signUpwithEmail(email, password);
    } on Exception {
      throw SignUpException('Cannot signup', 'Try again');
    }
  }
}
