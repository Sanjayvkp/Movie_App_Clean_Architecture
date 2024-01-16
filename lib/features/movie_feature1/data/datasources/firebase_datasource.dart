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
}
