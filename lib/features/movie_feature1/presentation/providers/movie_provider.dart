import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/exception/authentication/signin_exception.dart';
import 'package:movie_application/core/exception/authentication/signout_exception.dart';
import 'package:movie_application/core/exception/authentication/signup_exception.dart';
import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/core/utils/snackbar_utils.dart';
import 'package:movie_application/features/movie_feature1/data/repository/auth_repository_impl.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/logout_usecase.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/signin_usecase.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/signup_usecase.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/home_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/login_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@Riverpod(keepAlive: true)
class Movie extends _$Movie {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();
  late final AuthenticationRepository repository;

  @override
  void build(BuildContext context) {
    repository = ref.read(authenticationRepositoryProvider);
  }

  Future<void> signUpwithEmail(String email, String password) async {
    try {
      await SignUpUseCase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routePath));
    } on SignUpException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await SignInUseCase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routePath));
    } on SigninException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signOut() async {
    try {
      await SignOutUseCase(repository: repository)();
      Future.sync(() => context.go(LoginPage.routePath));
    } on SignOutException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}
