import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoginWithEmail {

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
    } on FirebaseException catch (e) {
      error = e.message;
    }catch(_){
      error = 'something went wrong please check your internet connection';
    }
  }
}
