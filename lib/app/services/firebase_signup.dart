import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSignup {
  static String? error;

  static Future<void> signupWithEmailAndPassword(
      {required String email, required String password}) async {
    error = null;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      error = e.message;
    }catch(e){
      error = 'something went wrong please check your internet connection';
    }
  }
}
