import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/custom_text_form_feild.dart';
import 'package:soukapp/view/seller_screens/add_product/small_add_product.dart';

class LargeAddProduct extends StatelessWidget {
  const LargeAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:  const [
          SizedBox(
            width: 600,
            child: SmallAddProduct(),
          ),
        ],
      ),
    );
  }
}
