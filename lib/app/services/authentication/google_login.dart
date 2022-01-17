import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

class GoogleLogin {
  static UserCredential? userCredential;
  static String? error;

  static Future<void> signInWithGoogle() async {
    userCredential = null;
    error = null;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
       userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = StringsManager.connectionError;
    }
  }

  static Future<void> webSignInWithGoogle() async {
    userCredential = null;
    error = null;
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

       userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = 'something went wrong please check your internet connection';
    }
  }
}
