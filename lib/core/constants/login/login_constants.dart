import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_constants.g.dart';

final class LoginConstants {
  final welcometxt = 'MaxLive';
  final emailtxt = 'Enter your Email';
  final passwordtxt = 'Enter your Password';
  final forgotpasswordtxt = 'Forgot your password?';
  final loginbtntxt = 'Sign in';
  final alternativetxt = 'or continue with';
}

@riverpod
LoginConstants loginConstants(LoginConstantsRef ref) {
  return LoginConstants();
}
