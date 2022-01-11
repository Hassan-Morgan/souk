import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/services/firebase_login.dart';
import 'package:soukapp/app/services/firebase_reset_password.dart';
import 'package:soukapp/app/services/firebase_signout.dart';
import 'package:soukapp/app/services/firebase_signup.dart';
import 'package:soukapp/view/custom_widgets/custom_snack_bar.dart';
import 'package:soukapp/view/home_page/home_page.dart';
import 'package:soukapp/view/user_auth/forgot_password/send_email.dart';
import 'package:soukapp/view/user_auth/login_page/login_page.dart';
import 'package:soukapp/view/user_auth/signup_page/signup_page.dart';

class AuthController extends GetxController {
  bool loading = false;


  sendResetPasswordCode({required String email}) async {
    loading = true;
    update();
    await ResetAccountPassword.sendResetCode(email: email);
    if (ResetAccountPassword.error == null) {
      loading = false;
      Get.offAll(const LogInPage());
      Get.showSnackbar(
        customGetSnackBar(
          title: 'reset password',
          message: 'please check your email',
        ),
      );
    } else {
      loading = false;
      update();
      Get.showSnackbar(
        customGetSnackBar(
          title: 'Sign Out error',
          message: FirebaseSignOut.error!,
        ),
      );
    }
  }

  signOut() async {
    loading = true;
    await FirebaseSignOut.signOut();
    if (FirebaseSignOut.error == null) {
      loading = false;
      Get.offAll(const LogInPage());
    } else {
      loading = false;
      update();
      Get.showSnackbar(
        customGetSnackBar(
          title: 'Sign Out error',
          message: FirebaseSignOut.error!,
        ),
      );
    }
  }

  signupWithUserNameAndPassword({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    loading = true;
    update();
    await FirebaseSignup.signupWithEmailAndPassword(
        email: email, password: password);
    if (FirebaseSignup.error == null) {
      loading = false;
      Get.offAll(const HomePage());
    }
    if (FirebaseSignup.error != null) {
      loading = false;
      update();
      Get.showSnackbar(customGetSnackBar(
          title: 'Signup Error', message: FirebaseSignup.error!));
    }
  }

  loginWithEmailAndPassword(
      {required String email, required String password}) async {
    loading = true;
    update();
    await FirebaseLoginWithEmail.loginWithEmailAndPassword(
        email: email, password: password);
    if (FirebaseLoginWithEmail.error == null) {
      loading = false;
      Get.offAll(const HomePage());
    }
    if (FirebaseLoginWithEmail.error != null) {
      loading = false;
      update();
      Get.showSnackbar(customGetSnackBar(
          title: 'Login Error', message: FirebaseLoginWithEmail.error!));
    }
  }

  navigateToResetPassword() {
    Get.to(SendEmail());
  }

  navigateToSignup() {
    Get.offAll(
      const SignupPage(),
      duration: const Duration(seconds: 1),
      transition: Transition.upToDown,
      curve: Curves.easeInBack,
    );
  }

  navigateToLogin() {
    Get.offAll(
      const LogInPage(),
      duration: const Duration(seconds: 1),
      transition: Transition.upToDown,
      curve: Curves.easeInBack,
    );
  }
}
