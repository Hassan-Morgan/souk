import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soukapp/app/resources_manager/constants.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/model/user_model.dart';

class FirestoreAddUser {
  static String? error;

  static Future<void> addUser({
    required String userId,
    required String userName,
    required String email,
    required phoneNumber,
  }) async {
    error = null;
    UserModel userModel = UserModel(
        uid: userId,
        email: email,
        userName: userName,
        profileImage: defaultProfileImage,
        phoneNumber: phoneNumber,
        wishList: [],
        cartItems: [],
        orders: []);
    Map<String, dynamic> data = userModel.toMap();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection('users').doc(userId).set(data);
    } on FirebaseException catch (e) {
      error = e.message;
    } catch (_) {
      error = StringsManager.connectionError;
    }
  }

  static Future<void> addSocialUser(
      {required UserCredential userCredential}) async {
    error = null;
    User user = userCredential.user!;
    UserModel userModel = UserModel(
        uid: user.uid,
        email: user.email!,
        userName: user.displayName!,
        profileImage: user.photoURL??defaultProfileImage,
        phoneNumber: user.phoneNumber??'',
        wishList: [],
        cartItems: [],
        orders: []);
    Map<String, dynamic> data = userModel.toMap();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
     await firestore.collection('users').doc(user.uid).set(data);
    } on FirebaseException catch (e) {
      error = e.message;
    } catch (_) {
      error = StringsManager.connectionError;
    }
  }
}
