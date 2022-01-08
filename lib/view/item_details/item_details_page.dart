import 'package:flutter/material.dart';
import 'package:soukapp/view/item_details/large_item_details.dart';
import 'package:soukapp/view/item_details/small_item_details.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: constrains.maxWidth < 650
            ? const SmallItemDetails()
            : const LargeItemDetails(),
      );
    });
  }
}
