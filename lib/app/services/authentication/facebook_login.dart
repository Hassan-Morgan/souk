import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

class FacebookLogin {
  static UserCredential? userCredential;
  static String? error;

  static Future<void> signInWithFacebook() async {
    userCredential = null;
    error = null;
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = StringsManager.connectionError;
    }
  }

  static Future<void> webSignInWithFacebook() async {
    userCredential = null;
    error = null;
    try {
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({
        'display': 'popup',
      });

      userCredential =
          await FirebaseAuth.instance.signInWithPopup(facebookProvider);
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (_) {
      error = StringsManager.connectionError;
    }
  }
}
