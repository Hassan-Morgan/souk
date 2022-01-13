import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/services/facebook_login.dart';
import 'package:soukapp/app/services/firebase_login.dart';
import 'package:soukapp/app/services/firebase_reset_password.dart';
import 'package:soukapp/app/services/firebase_signout.dart';
import 'package:soukapp/app/services/firebase_signup.dart';
import 'package:soukapp/app/services/google_login.dart';
import 'package:soukapp/view/custom_widgets/custom_snack_bar.dart';
import 'package:soukapp/view/home_page/home_page.dart';
import 'package:soukapp/view/user_auth/forgot_password/send_email.dart';
import 'package:soukapp/view/user_auth/login_page/login_page.dart';
import 'package:soukapp/view/user_auth/signup_page/signup_page.dart';

class AuthController extends GetxController {
  bool loading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  webLoginWithGoogle() async {
    loading = true;
    update();
    await GoogleLogin.webSignInWithGoogle();
    if (GoogleLogin.error == null) {
      loading = false;
      Get.offAll(const HomePage());
    } else {
      loading = false;
      update();
      Get.showSnackbar(
        customGetSnackBar(
          title: 'Login Error',
          message: GoogleLogin.error!,
        ),
      );
    }
  }


  loginWithGoogle() async {
    loading = true;
    update();
    await GoogleLogin.signInWithGoogle();
    if (GoogleLogin.error == null) {
      loading = false;
      Get.offAll(const HomePage());
    } else {
      loading = false;
      update();
      Get.showSnackbar(
        customGetSnackBar(
          title: 'Login Error',
          message: GoogleLogin.error!,
        ),
      );
    }
  }

  webLoginWithFacebook() async {
    loading = true;
    update();
    await FacebookLogin.webSignInWithFacebook();
    if (FacebookLogin.error == null) {
      loading = false;
      Get.offAll(const HomePage());
    } else {
      loading = false;
      update();
      Get.showSnackbar(
        customGetSnackBar(
          title: 'Login error',
          message: FacebookLogin.error!,
        ),
      );
    }
  }

  loginWithFacebook() async {
    loading = true;
    update();
    await FacebookLogin.signInWithFacebook();
    if (FacebookLogin.error == null) {
      loading = false;
      Get.offAll(const HomePage());
    } else {
      loading = false;
      update();
      Get.showSnackbar(
        customGetSnackBar(
          title: 'Login error',
          message: FacebookLogin.error!,
        ),
      );
    }
  }

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
          title: 'Reset password error',
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

  signupWithUserNameAndPassword() async {
    loading = true;
    update();
    await FirebaseSignup.signupWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
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

  loginWithEmailAndPassword() async {
    loading = true;
    update();
    await FirebaseLoginWithEmail.loginWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
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