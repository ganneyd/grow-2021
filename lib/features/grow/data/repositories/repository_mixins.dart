///Repositories may all want to run similar code, so this class allows that
///reducing code duplication
abstract class RepoMixins {
  // This class is intended to be used as a mixin, and should not be
  // extended directly.

  ///method to handle sign up error codes
  String getFirebaseAuthMsg(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already in use, please use another email';
      case 'invalid-email':
        return 'This email is invalid, please use another email';
      case 'operation-not-allowed':
        return 'This email is not enable please enable to continue';
      case 'weak-password':
        return 'This password is too weak, please choose a stronger password';
      case 'user-disabled':

        // ignore: lines_longer_than_80_chars
        //TODO place contact email here for the user to email to enable their acc
        return 'Your account is currently disabled, please contact[email] ';
      default:
        return code;
    }
  }
}
