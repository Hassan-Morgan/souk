import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

class KidsCategoriesList extends StatelessWidget {
  const KidsCategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: ColorManager.greyColor,
          child: Text(
            StringsManager.kidsCategories,
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
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(StringsManager.babiesCategory),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(StringsManager.girlsCategory),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(StringsManager.boysCategory),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(StringsManager.underWearCategory),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(StringsManager.accessoriesCategory),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
