import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/exception/authentication/signin_exception.dart';
import 'package:movie_application/core/exception/authentication/signout_exception.dart';
import 'package:movie_application/core/exception/authentication/signup_exception.dart';
import 'package:movie_application/core/exception/base_exception.dart';
import 'package:movie_application/core/utils/snackbar_utils.dart';
import 'package:movie_application/features/movie_feature1/data/repository/auth_repository_impl.dart';
import 'package:movie_application/features/movie_feature1/domain/repository/auth_repository.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/google_signin_usecase.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/login_with_phone_usecase.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/logout_usecase.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/password_reset_usecase.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/signin_usecase.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/signup_usecase.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/verify_email_usecase.dart';
import 'package:movie_application/features/movie_feature1/domain/usecases/verify_otp_usecase.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/login_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/otp_verified_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/providers/auth_state.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/homepage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Movie extends _$Movie {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();
  final TextEditingController phonenumberlogincontroller =
      TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();
  late final AuthenticationRepository repository;

  @override
  AuthState build() {
    repository = ref.read(authenticationRepositoryProvider);
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> signUpwithEmail(
      BuildContext context, String email, String password) async {
    try {
      await SignUpUseCase(repository: repository)(email, password);
      Future.sync(() => verifyEmail(context));
      Future.sync(() => context.go(HomePage.routePath));
    } on SignUpException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> passwordResetEmail(BuildContext context, String email) async {
    try {
      await PasswordResetEmailUsecase(repository: repository)(email);
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyEmail(BuildContext context) async {
    try {
      await EmailVerificationUsecase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      await GoogleSignInUsecase(repository: repository)();
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithEmail(
      BuildContext context, String email, String password) async {
    try {
      await SignInUseCase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routePath));
    } on SigninException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithPhone(BuildContext context, String phone) async {
    try {
      final verificationData =
          await LoginwithPhoneUsecase(repository: repository)(phone);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => context.push(OtpVerificationPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpUsecase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signOut(BuildContext context) async {
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
