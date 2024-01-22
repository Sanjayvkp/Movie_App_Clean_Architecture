import 'package:movie_application/core/exception/authentication/invalid_credential_exception.dart';
import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class LoginwithPhoneUsecase {
  final AuthenticationRepository repository;
  LoginwithPhoneUsecase({required this.repository});
  Future<(String, int?)> call(String phone) async {
    if (phone.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      return await repository.loginWithPhone(phone);
    } on Exception {
      throw BaseException('Enter your phone number correctly');
    }
  }
}
