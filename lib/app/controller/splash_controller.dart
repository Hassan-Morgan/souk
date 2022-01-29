import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/home_page/home_page.dart';
import 'package:soukapp/view/seller_screens/home_seller_screen.dart';
import 'package:soukapp/view/user_auth/login_page/login_page.dart';

class SplashController extends GetxController {
  late Timer _timer;
  User? user;

  @override
  void onInit() {
    user = FirebaseAuth.instance.currentUser;
    _timer = Timer(const Duration(seconds: 3), () {
      if (user == null) {
        Get.off(const LogInPage(),
            duration: const Duration(milliseconds: 600),
            transition: Transition.zoom,
            curve: Curves.linear);
      } else if(user!.email == StringsManager.sellerDefaultEmail){
        Get.off(const SellerHome(),
            duration: const Duration(milliseconds: 600),
            transition: Transition.zoom,
            curve: Curves.linear);
      }else{
        Get.off(const HomePage(),
            duration: const Duration(milliseconds: 600),
            transition: Transition.zoom,
            curve: Curves.linear);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
