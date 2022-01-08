import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soukapp/app/controller/home_page_controller.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/view/categories_page/categories_page.dart';
import 'package:soukapp/view/home_page/home_page.dart';

class TopBarLarge extends StatelessWidget {
  const TopBarLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) => Container(
        color: ColorManager.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              TextButton(
                onHover: (event) {
                  controller.changeButtonState(event, 'homeButton');
                },
                onPressed: () {
                  Get.offAll(const HomePage());
                },
                child: Text(
                  'Home',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              TextButton(
                onHover: (bool event) {
                  controller.changeButtonState(event, 'categoriesButton');
                },
                onPressed: () {
                  Get.offAll(const CategoriesPage());
                },
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: IconManger.bottomNavigationAccount,
                        ),
                        Text('Profile'),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: IconManger.bottomNavigationCart,
                        ),
                        Text('Cart'),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
