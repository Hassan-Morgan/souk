import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/controller/add_product_controller.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/custom_button.dart';
import 'package:soukapp/view/custom_widgets/custom_text_form_feild.dart';

class SmallAddProduct extends StatelessWidget {
  const SmallAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
        init: AddProductController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                    labelText: StringsManager.productName,
                    isSecure: false,
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'product name can\'t be empty';
                      }
                      return null;
                    },
                    prefixIcon: IconManger.productIcon,
                    keyType: TextInputType.text,
                    textController: TextEditingController()),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    maxLines: 4,
                    labelText: StringsManager.productDescription,
                    isSecure: false,
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'product description can\'t be empty';
                      }
                      return null;
                    },
                    prefixIcon: IconManger.descriptionIcon,
                    keyType: TextInputType.text,
                    textController: TextEditingController()),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    isNumber: true,
                    labelText: StringsManager.productPrice,
                    isSecure: false,
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'price can\'t be empty';
                      }
                      return null;
                    },
                    prefixIcon: IconManger.priceIcon,
                    keyType: TextInputType.number,
                    textController: TextEditingController()),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    isNumber: true,
                    labelText: StringsManager.productQuantity,
                    isSecure: false,
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'price can\'t be empty';
                      }
                      return null;
                    },
                    prefixIcon: IconManger.priceIcon,
                    keyType: TextInputType.number,
                    textController: TextEditingController()),
                const SizedBox(
                  height: 20,
                ),
                selectGender(controller: controller, context: context),
                const SizedBox(
                  height: 20,
                ),
                if (controller.productImages.isNotEmpty)
                  viewSelectedImages(controller: controller),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPress: () {
                    controller.pickImage();
                  },
                  buttonName: StringsManager.addProductImages,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (controller.productColors.isNotEmpty)
                  viewSelectedColors(selectedColors: controller.productColors),
                CustomButton(
                  onPress: () {
                    controller.selectProductColors(context);
                  },
                  buttonName: StringsManager.addProductColors,
                ),
              ],
            ),
          );
        });
  }
}

Widget selectCategory({required AddProductController controller, required BuildContext context}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        StringsManager.selectProductCategory,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      DropdownButton(
          value: controller.genderMenuValue,
          items: const [
            DropdownMenuItem(
              child: Text(StringsManager.menCategories),
              value: 0,
            ),
            DropdownMenuItem(
              child: Text(StringsManager.womenCategories),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text(StringsManager.kidsCategories),
              value: 2,
            ),
          ],
          onChanged: (dynamic value) {
            controller.changeGenderMenuItem(value);
          }),
    ],
  );
}

Widget viewSelectedColors({required List<Color> selectedColors}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: selectedColors
          .map((e) => Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: e, shape: BoxShape.circle),
                width: 40,
                height: 40,
              ))
          .toList(),
    ),
  );
}

Widget selectGender(
    {required AddProductController controller, required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        StringsManager.selectProductGender,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      DropdownButton(
          value: controller.genderMenuValue,
          items: const [
            DropdownMenuItem(
              child: Text(StringsManager.menCategories),
              value: 0,
            ),
            DropdownMenuItem(
              child: Text(StringsManager.womenCategories),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text(StringsManager.kidsCategories),
              value: 2,
            ),
          ],
          onChanged: (dynamic value) {
            controller.changeGenderMenuItem(value);
          }),
    ],
  );
}

Widget viewSelectedImages({required AddProductController controller}) {
  return SizedBox(
    height: 300,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.productImages.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.file(File(controller.productImages[index].path)),
            IconButton(
              onPressed: () {
                controller.removeImage(index);
              },
              color: ColorManager.redGoogleColor,
              icon: IconManger.deleteIcon,
            ),
          ],
        ),
      ),
    ),
  );
}
