import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class VerifyOtpUsecase {
  final AuthenticationRepository repository;
  VerifyOtpUsecase({required this.repository});
  Future<void> call(String otp) async {
    try {
      await repository.verifyOtp(otp);
    } on Exception {
      throw BaseException('Enter your Phone number correctly');
    }
  }
}
