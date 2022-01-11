import 'package:flutter/material.dart';
import 'package:soukapp/view/app_layout/small_app_layout.dart';
import 'package:soukapp/view/categories_page/large_categories_page.dart';
import 'package:soukapp/view/categories_page/small_categories_page.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return constrains.maxWidth < 600
          ?  AppLayout()
          : const LargeCategoriesPage();
    });
  }
}
