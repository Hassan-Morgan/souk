import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseSignOut {

  static String? error;

  static Future<void> signOut() async {
    error = null;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
    } on FirebaseException catch (e) {
      error = e.message;
    }catch(e){
      error = 'something went wrong please check your internet connection';
    }
  }
}
