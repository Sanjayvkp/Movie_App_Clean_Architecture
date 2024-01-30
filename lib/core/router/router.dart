import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/login_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/login_with_phone_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/otp_verified_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/signup_page.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/movie_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/gridview_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/homepage.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/overview_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/profile_page.dart';
import 'package:movie_application/features/movie_feature2/presentation/pages/youtube_trailer_page.dart';

final router = GoRouter(
  initialLocation: HomePage.routePath,
  routes: [
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) {
        return const HomePage();
      },
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null || (!user.emailVerified && user.phoneNumber == null)) {
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
    GoRoute(
      path: OverviewPage.routePath,
      builder: (context, state) {
        return OverviewPage(
          entity: state.extra as MovieEntity,
        );
      },
    ),
    GoRoute(
      path: GridViewPage.routePath,
      builder: (context, state) {
        final data = state.extra as (List<MovieEntity>, String);
        return GridViewPage(
          entity: data.$1,
          text: data.$2,
        );
      },
    ),
    GoRoute(
      path: ProfilePage.routePath,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: YoutubePlayerPage.routePath,
      builder: (context, state) => const YoutubePlayerPage(),
    ),
  ],
);
