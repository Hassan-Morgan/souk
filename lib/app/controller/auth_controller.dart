import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:soukapp/view/login_page/login_page.dart';
import 'package:soukapp/view/signup_page/signup_page.dart';

class AuthController extends GetxController {
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
