import 'package:flutter/material.dart';
import 'package:soukapp/view/custom_widgets/default_item_card.dart';

class CategoryListViewer extends StatelessWidget {
  CategoryListViewer({Key? key}) : super(key: key);

  final List items = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: items.map((e) => const DefaultItemCard()).toList(),
    );
  }
}
