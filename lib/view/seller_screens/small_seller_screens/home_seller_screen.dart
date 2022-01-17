import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/custom_button.dart';

class SmallSellerHome extends StatelessWidget {
  const SmallSellerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsManager.homeAppBarTitle),
      ),
      body: Column(
        children: [
          CustomButton(onPress: (){}, buttonName: StringsManager.sellerAddProduct),
          CustomButton(onPress: (){}, buttonName: StringsManager.sellerAddProduct),
          CustomButton(onPress: (){}, buttonName: StringsManager.sellerAddProduct),
        ],
      ),
    );
  }
}
