import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_application/features/movie_feature1/data/datasources/firebase_datasource.dart';
import 'package:movie_application/features/movie_feature1/data/datasources/firebase_datasource_impl.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuthentication dataSource;
  AuthenticationRepositoryImpl({required this.dataSource});

  @override
  Future<void> signInwithEmail(String email, String password) {
    return dataSource.signinEmail(email, password);
  }

  @override
  Future<void> signUpwithEmail(String email, String password) {
    return dataSource.signupEmail(email, password);
  }

  @override
  Future<void> signOut() {
    return dataSource.signout();
  }

  @override
  Future<void> verifyEmail() async {
    await dataSource.verifyEmail();
  }
}

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
      dataSource: ref.watch(firebaseAuthProvider));
}
