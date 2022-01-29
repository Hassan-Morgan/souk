import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/constants.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

class MenCategoriesList extends StatelessWidget {
  const MenCategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: ColorManager.greyColor,
          child: Text(
            StringsManager.menCategories,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: menCategories
                .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextButton(
                        onPressed: () {},
                        child: Text(e),
                      ),
                ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
