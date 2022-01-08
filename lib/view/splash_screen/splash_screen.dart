import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/controller/splash_controller.dart';
import 'package:soukapp/app/resources_manager/assets_manager.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) => Center(
          child: Image.asset(
            AssetsManager.whiteAppIcon,width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
