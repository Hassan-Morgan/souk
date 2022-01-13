import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLogin {
  static User? user;
  static String? error;

  static Future<void> signInWithFacebook() async {
    user = null;
    error = null;
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential credential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      user = credential.user;
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = 'something went wrong please check your internet connection';
    }
  }

  static Future<void> webSignInWithFacebook() async {
    user = null;
    error = null;
    try {
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({
        'display': 'popup',
      });

      UserCredential credential =
          await FirebaseAuth.instance.signInWithPopup(facebookProvider);
      user = credential.user;
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = 'something went wrong please check your internet connection';
    }
  }
}
