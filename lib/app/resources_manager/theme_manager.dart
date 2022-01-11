import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/font_manager.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: ColorManager.whiteColor,
      iconTheme: IconThemeData(
        color: ColorManager.blackColor
      ),
      centerTitle: true,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    scaffoldBackgroundColor: ColorManager.whiteColor,
    primaryColor: ColorManager.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorManager.primaryColor,
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w200,
        ),
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextManager.headline1,
      headline2: TextManager.headline2,
      button: TextManager.button,
      headline3: TextManager.headline3,
      subtitle1: TextManager.subtitle1,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorManager.primaryColor,
      selectedItemColor: ColorManager.whiteColor,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    ),
  );
}
