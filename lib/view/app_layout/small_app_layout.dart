import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/controller/app_layout_controller.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';

class AppLayout extends StatelessWidget {
  AppLayout({Key? key}) : super(key: key);

  final controller2 = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLayoutController>(
        init: AppLayoutController(),
        builder: (controller) {
          return Scaffold(
            body: controller.pages[controller.currentPageIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                controller.changePageIndex(index);
              },
              currentIndex: controller.currentPageIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: IconManger.bottomNavigationHome, label: 'Home'),
                BottomNavigationBarItem(
                    icon: IconManger.bottomNavigationSearch, label: 'Search'),
                BottomNavigationBarItem(
                    icon: IconManger.bottomNavigationCat, label: 'Categories'),
                BottomNavigationBarItem(
                    icon: IconManger.bottomNavigationCart, label: 'Cart'),
                BottomNavigationBarItem(
                    icon: IconManger.bottomNavigationAccount, label: 'Account'),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller2.signOut();
              },
            ),
          );
        });
  }
}
