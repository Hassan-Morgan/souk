import 'package:firebase_auth/firebase_auth.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

class ResetAccountPassword {
  static String? error;

  static Future<void> sendResetCode({required String email}) async {
    error = null;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);

    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = StringsManager.connectionError;
    }
  }
}
