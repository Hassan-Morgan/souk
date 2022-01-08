import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:soukapp/view/item_details/item_details_page.dart';

class DefaultItemCard extends StatelessWidget {
  const DefaultItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Get.to(const ItemDetails());
      },
      child: Stack(
        children: [
          Card(
            child: SizedBox(
              height: 320,
              width: 150,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Image.network(
                      'https://pyxis.nymag.com/v1/imgs/c4e/674/1892c1d09ba24378b0d547eeaffa7fac93-EN-US-Worn-S1-Main-Vertical-27x40-RGB-PR.rvertical.w600.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'this is the head of demo item',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: const [
                          Text('250 \$'),
                          Spacer(),
                          Text(
                            '300 \$',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: -5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.red,
              child: const Text('50%'),
            ),
          ),
        ],
      ),
    );
  }
}
