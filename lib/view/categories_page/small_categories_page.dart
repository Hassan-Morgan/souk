import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/view/categories_page/shared_parts/categories_list.dart';
import 'package:soukapp/view/categories_page/shared_parts/category_item_viewer.dart';

class SmallCategoriesPage extends StatelessWidget {
  SmallCategoriesPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: ColorManager.primaryColor,
            title: const Text('All Items'),
            leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: IconManger.leadingIcon),
          ),
        ],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CategoryListViewer(),
              ],
            ),
          ),
        ),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width*0.7,
          color: ColorManager.whiteColor, child: const CategoriesList()),
    );
  }
}
