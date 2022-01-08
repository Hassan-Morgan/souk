import 'package:flutter/material.dart';
import 'package:soukapp/view/categories_page/shared_parts/categories_list.dart';
import 'package:soukapp/view/categories_page/shared_parts/category_item_viewer.dart';
import 'package:soukapp/view/custom_widgets/large_app_top_bar.dart';

class LargeCategoriesPage extends StatelessWidget {
  const LargeCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TopBarLarge(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 230,
                    child: Positioned(
                      child: CategoriesList(),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'All Items',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      CategoryListViewer(),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
