import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class LoginwithPhoneUsecase {
  final AuthenticationRepository repository;
  LoginwithPhoneUsecase({required this.repository});
  Future<void> call(String phone) async {
    try {
      await repository.loginWithPhone(phone);
    } on Exception {
      throw BaseException('Enter your Phone number correctly');
    }
  }
}
