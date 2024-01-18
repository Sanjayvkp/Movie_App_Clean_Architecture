abstract class AuthenticationRepository {
  Future<void> signInwithEmail(String email, String password);
  Future<void> signUpwithEmail(String email, String password);
  Future<void> signOut();
  Future<void> verifyEmail();
  Future<void> googleSignIn();
  Future<void> passwordResetEmail(String email);
  Future<void> loginWithPhone(String phone);
  Future<void> verifyOtp(String otp);
}
