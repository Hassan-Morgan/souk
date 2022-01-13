import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/controller/home_page_controller.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/kids_categories_list.dart';
import 'package:soukapp/view/custom_widgets/large_app_top_bar.dart';
import 'package:soukapp/view/custom_widgets/men_categories_list.dart';
import 'package:soukapp/view/custom_widgets/women_categories_list.dart';
import 'package:soukapp/view/home_page/shared_parts/home_body.dart';
import 'package:soukapp/view/home_page/shared_parts/home_header.dart';

class LargeHomePage extends StatelessWidget {
   LargeHomePage({Key? key}) : super(key: key);

 final AuthController controller2 = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: ColorManager.primaryColor,
                      child: const TopBarLarge(),
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            const HomeHeader(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(child: _searchBar(context)),
                                  const HomeBody(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (controller.categoriesButtonSelected ||
                            controller.categoriesMenuSelected)
                          InkWell(
                            onTap: () {},
                            onHover: (event) {
                              controller.changeButtonState(
                                  event, 'categoriesMenu');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              color: ColorManager.whiteColor,
                              child: _categoriesMenu(context),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                controller2.signOut();
              },
            ),
          );
        });
  }
}

Widget _categoriesMenu(context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Expanded(
        child: MenCategoriesList(),
      ),
      Expanded(
        child: WomenCategoriesList(),
      ),
      Expanded(child: KidsCategoriesList()),
    ],
  );
}

Widget _brandsMenu(context) {
  List<String> list = [
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
    'h&m',
    'adidas',
    'nike',
  ];

  return Wrap(
    children: list
        .map(
            (e) => Container(padding: const EdgeInsets.all(20), child: Text(e)))
        .toList(),
  );
}

Widget _searchBar(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.6,
    child: TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.015,
        ),
        hintText: StringsManager.searchBarLabel,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: IconManger.bottomNavigationSearch,
        ),
      ),
    ),
  );
}
