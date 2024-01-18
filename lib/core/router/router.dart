import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/home_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/login_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/login_with_phone_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/otp_verified_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/signup_page.dart';

final router = GoRouter(initialLocation: HomePage.routePath, routes: [
  GoRoute(
    path: HomePage.routePath,
    builder: (context, state) {
      return const HomePage();
    },
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null || !user.emailVerified ) {
        return LoginPage.routePath;
      }
      return null;
    },
  ),
  GoRoute(
    path: SignupPage.routePath,
    builder: (context, state) {
      return const SignupPage();
    },
  ),
  GoRoute(
    path: LoginPage.routePath,
    builder: (context, state) {
      return const LoginPage();
    },
  ),
  GoRoute(
    path: LoginPageWithPhone.routePath,
    builder: (context, state) {
      return const LoginPageWithPhone();
    },
  ),
  GoRoute(
    path: OtpVerificationPage.routePath,
    builder: (context, state) {
      return const OtpVerificationPage();
    },
  ),
]);
