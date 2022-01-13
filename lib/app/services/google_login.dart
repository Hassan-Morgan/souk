import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  static User? user;
  static String? error;

  static Future<void> signInWithGoogle() async {
    user = null;
    error = null;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = 'something went wrong please check your internet connection';
    }
  }

  static Future<void> webSignInWithGoogle() async {
    user = null;
    error = null;
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = 'something went wrong please check your internet connection';
    }
  }
}
