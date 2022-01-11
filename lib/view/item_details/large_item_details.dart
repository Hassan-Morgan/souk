import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/view/custom_widgets/custom_button.dart';
import 'package:soukapp/view/custom_widgets/large_app_top_bar.dart';

class LargeItemDetails extends StatelessWidget {
  const LargeItemDetails({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopBarLarge(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      'https://assets.vogue.com/photos/60e4c06460eb32a68f16c1cb/master/w_1280%2Cc_limit/slide_19.jpg',
                      height: 500,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'the item name',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(fontSize: 24),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Size : ',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              DropdownButton(
                                  items: ['l', 'xl', 'xxl']
                                      .map((e) =>
                                          DropdownMenuItem(child: Text(e),value: e,))
                                      .toList(),
                                  onChanged: (value) => print(value) ,)
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Choose Colors And quantity You Want',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Column(
                            children: colorsList
                                .map((e) => Row(
                                      children: [
                                        const Text('0'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            color: e,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Slider(
                                          max: 5,
                                          value: 0,
                                          onChanged: (value) {},
                                          divisions: 5,
                                        ),
                                      ],
                                    ))
                                .toList(),
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Items : ',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text('0'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              onPress: () {}, buttonName: 'Add to Favorites'),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              onPress: () {}, buttonName: '    Add To Cart   ')
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Color> colorsList = [
  ColorManager.primaryColor,
  ColorManager.greyColor,
  ColorManager.blackColor,
  ColorManager.whiteColor,
];
