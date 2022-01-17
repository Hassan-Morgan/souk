import 'package:firebase_auth/firebase_auth.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

class FirebaseLoginWithEmail {
  static User? user;
  static String? error;

  static Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    error = null;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = credential.user;
    } on FirebaseException catch (e) {
      error = e.message;
    }catch(_){
      error = StringsManager.connectionError;
    }
  }
}
