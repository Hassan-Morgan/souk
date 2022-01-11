import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword {
  static String? error;

  static Future<void> sendResetCode({required String email}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = 'something went wrong please check your internet connection';
    }
  }

  static Future<void> resetPassword(
      {required String code, required String newPassword}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.confirmPasswordReset(code: code, newPassword: newPassword);
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = 'something went wrong please check your internet connection';
    }
  }
}
