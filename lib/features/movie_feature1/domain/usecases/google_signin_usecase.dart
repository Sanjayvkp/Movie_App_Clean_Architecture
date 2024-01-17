import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class GoogleSignInUsecase {
  final AuthenticationRepository repository;

  GoogleSignInUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.googleSignIn();
    } on Exception {
      throw BaseException(
        'Cannot login with google',
      );
    }
  }
}
