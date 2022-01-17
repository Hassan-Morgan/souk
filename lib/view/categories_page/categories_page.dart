import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soukapp/view/categories_page/large_categories_page.dart';
import 'package:soukapp/view/categories_page/small_categories_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return kIsWeb ? const LargeCategoriesPage() : SmallCategoriesPage();
    });
  }
}
