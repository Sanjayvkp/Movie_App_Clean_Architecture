import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_constants.g.dart';

final class LoginConstants {
  final welcometxt = 'Welcome Back';
  final emailtxt = 'Email';
  final passwordtxt = 'Password';
  final forgotpasswordtxt = 'Forgot your password?';
  final loginbtntxt = 'Sign in';
  final alternativetxt = 'or continue with';
  final registertxt = 'Don"t have an account?';
  final registerbtntxt = 'Sign up';
  final movielogo = 'assets/images/movie_logo3.png';
  final googlelogo = 'assets/images/login_google.png';
}

@riverpod
LoginConstants loginConstants(LoginConstantsRef ref) {
  return LoginConstants();
}
