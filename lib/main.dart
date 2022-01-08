import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:soukapp/app/resources_manager/theme_manager.dart';
import 'package:soukapp/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const SoukApp());
}

class SoukApp extends StatelessWidget {
  const SoukApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
      home: const SplashScreen(),
    );
  }
}
