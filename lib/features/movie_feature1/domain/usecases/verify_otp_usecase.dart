import 'package:movie_application/core/exception/authentication/invalid_credential_exception.dart';
import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class VerifyOtpUsecase {
  final AuthenticationRepository repository;
  VerifyOtpUsecase({required this.repository});
  Future<void> call(String verificationId, String otp) async {
    if (otp.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.verifyOtp(verificationId, otp);
    } on Exception {
      throw BaseException('Enter your otp correctly,try again');
    }
  }
} 