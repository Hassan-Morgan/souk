import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/view/categories_page/small_categories_page.dart';
import 'package:soukapp/view/home_page/small_home_page.dart';

class AppLayoutController extends GetxController {
  int currentPageIndex = 0;

  List<Widget> pages = [
    SmallHomePage(),
    SmallHomePage(),
    SmallCategoriesPage(),
    SmallHomePage(),
    SmallHomePage(),
  ];

  void changePageIndex(index) {
    currentPageIndex = index;
    update();
  }
}
