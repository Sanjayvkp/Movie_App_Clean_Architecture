import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class PasswordResetEmailUsecase {
  final AuthenticationRepository repository;
  PasswordResetEmailUsecase({required this.repository});
  Future<void> call(String email) async {
    try {
      await repository.passwordResetEmail(email);
    } on Exception {
      throw BaseException('enter your email in text field');
    }
  }
}
