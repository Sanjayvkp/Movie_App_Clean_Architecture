import 'package:movie_application/core/exception/authentication/signout_exception.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';

final class SignOutUseCase {
  final AuthenticationRepository repository;
  SignOutUseCase({required this.repository});

  Future<void> call() async {
    try {
      await repository.signOut();
    } on Exception {
      throw SignOutException('Cannot logout', 'Please check network');
    }
  }
}
