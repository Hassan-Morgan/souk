import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:soukapp/view/login_page/login_page.dart';

class SplashController extends GetxController {
  late Timer _timer;

  @override
  void onInit() {
    _timer = Timer(const Duration(seconds: 3), () {
      Get.off(const LogInPage(),
          duration: const Duration(milliseconds: 600),
          transition: Transition.fadeIn,
          curve: Curves.linear);
    });
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
