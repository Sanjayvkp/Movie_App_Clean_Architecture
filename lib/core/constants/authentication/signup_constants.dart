import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_constants.g.dart';

class SignupConstants {
  final welcometxt = 'Lets get started!';
  final user = 'Username';
  final phonenumber = 'Phone number';
  final emailtxt = 'Email';
  final passwordtxt = 'Password';
  final confirmpassword = 'Confirm Password';
  final signupbtntxt = 'Sign up';
  final forgotpassword = 'Forgot your password?';
  final alternativetxt = 'or continue with';
  final alreadyuser = 'Already have an account?';
  final loginnow = 'Login';
}

@riverpod
SignupConstants signupConstants(SignupConstantsRef ref) {
  return SignupConstants();
}
