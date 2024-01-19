abstract class FirebaseAuthentication {
  Future<void> signupEmail(
    String email,
    String password,
  );
  Future<void> signinEmail(
    String email,
    String password,
  );
  Future<void> signout();
  Future<void> verifyEmail();
  Future<void> googleSignIn();
  Future<void> passwordResetEmail(String email);
  Future<(String, int?)> loginWithPhone(String phone);
  Future<void> verifyOtp(String verificationId, String otp);
}
