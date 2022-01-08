import 'package:flutter/cupertino.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';

class TextManager {
  static const TextStyle headline1 = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    color: ColorManager.blackColor,
    letterSpacing: 2.1,
  );
  static const TextStyle headline2 = TextStyle(
    fontSize: 25,
    color: ColorManager.greyColor,
    letterSpacing: 0.5,
  );
  static const TextStyle button = TextStyle(
    fontSize: 16,
    color: ColorManager.whiteColor,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    color: ColorManager.blackColor,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle headline3 = TextStyle(
    fontSize: 24,
    letterSpacing: 0.5,
    color: ColorManager.whiteColor,
    fontWeight: FontWeight.w500,
  );
}
