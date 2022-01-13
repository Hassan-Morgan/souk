import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/assets_manager.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/default_item_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        _discoverByGender(context),
        const SizedBox(
          height: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    StringsManager.newItems,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('see all'))
              ],
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => const DefaultItemCard()),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    StringsManager.bestOffers,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('see all'))
              ],
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => const DefaultItemCard()),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _discoverByGender(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        StringsManager.homeDiscoverByGender,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontSize: MediaQuery.of(context).size.width * 0.03),
      ),
      Row(
        children: [
          _defaultDiscoverCard(
              context: context,
              text: 'Men Clothes',
              image: AssetsManager.homeManIcon),
          _defaultDiscoverCard(
              context: context,
              text: 'Women Clothes',
              image: AssetsManager.homeWomanIcon),
          _defaultDiscoverCard(
              context: context,
              text: 'Kids Clothes',
              image: AssetsManager.homeBoyIcon),
        ],
      ),
    ],
  );
}

Widget _defaultDiscoverCard({required context, required text, required image}) {
  return Expanded(
    child: Padding(
      padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.005),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Center(
              child: Text(
            text,
            style: TextStyle(
                color: ColorManager.whiteColor,
                fontSize: MediaQuery.of(context).size.width * 0.02),
          ))
        ],
      ),
    ),
  );
}
