
import 'package:movie_application/core/exception/authentication/invalid_credential_exception.dart';
import 'package:movie_application/core/exception/authentication/signin_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class SignInUseCase {
  final AuthenticationRepository repository;
  SignInUseCase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
       await repository.signInwithEmail(email, password);
    } on Exception {
      throw SigninException('Cannot login', 'Try again');
    }
  }
}
