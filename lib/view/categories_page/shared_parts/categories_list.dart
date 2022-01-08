import 'package:flutter/cupertino.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/view/custom_widgets/kids_categories_list.dart';
import 'package:soukapp/view/custom_widgets/men_categories_list.dart';
import 'package:soukapp/view/custom_widgets/women_categories_list.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const MenCategoriesList(),
            Container(
              margin: const EdgeInsets.all(20),
              height: 1.5,
              width: double.infinity,
              color: ColorManager.blackColor,
            ),
            const WomenCategoriesList(),
            Container(
              margin: const EdgeInsets.all(20),
              height: 1.5,
              width: double.infinity,
              color: ColorManager.blackColor,
            ),
            const KidsCategoriesList(),
            Container(
              margin: const EdgeInsets.all(20),
              height: 1.5,
              width: double.infinity,
              color: ColorManager.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
