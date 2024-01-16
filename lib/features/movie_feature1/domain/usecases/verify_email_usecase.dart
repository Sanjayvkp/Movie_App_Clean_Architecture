import 'package:movie_application/core/exception/authentication/signup_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class EmailVerificationUsecase {
  final AuthenticationRepository repository;
  EmailVerificationUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.verifyEmail();
    } on Exception {
      throw SignUpException('Cannot login', 'Try again');
    }
  }
}
