import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

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
      error = StringsManager.connectionError;
    }
  }
}
