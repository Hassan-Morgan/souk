import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

import 'add_product/add_product.dart';

class SellerHome extends StatelessWidget {
  const SellerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.homeAppBarTitle,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          bottom: TabBar(
            unselectedLabelColor: ColorManager.blackColor,
            labelColor: ColorManager.primaryColor,
            indicatorColor: ColorManager.primaryColor,
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 20),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            overlayColor: MaterialStateProperty.all(ColorManager.primaryColor),
            tabs: const [
              Tab(
                text: StringsManager.sellerAddProduct,
              ),
              Tab(
                text: StringsManager.sellerDeleteProduct,
              ),
              Tab(
                text: StringsManager.sellerAddOffer,
              ),
              Tab(
                text: StringsManager.sellerDeleteOffer,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: TabBarView(children: [
            const AddProduct(),
            Container(),
            Container(),
            Container(),
          ]),
        ),
      ),
    );
  }
}
