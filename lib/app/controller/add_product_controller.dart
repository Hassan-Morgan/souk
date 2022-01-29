import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soukapp/view/custom_widgets/custom_button.dart';

class AddProductController extends GetxController {
  List<XFile> productImages = [];
  int genderMenuValue = 0;
  List<Color> productColors = [];
  List<Color> colors = [
    Colors.white,
    Colors.grey,
    Colors.black,
    Colors.pink,
    Colors.red,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.purple,
    Colors.brown,
  ];

  selectProductColors(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Pick a color!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MultipleChoiceBlockPicker(
                  availableColors: colors,
                  pickerColors: productColors,
                  onColorsChanged: (colors) {
                    productColors = colors;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onPress: () {
                      update();
                      Get.back();
                    },
                    buttonName: 'done')
              ],
            )));
  }

  changeGenderMenuItem(index) {
    genderMenuValue = index;
    update();
  }

  pickImage() async {
    ImagePicker _picker = ImagePicker();
    List<XFile>? images = await _picker.pickMultiImage();
    for (XFile e in images!) {
      productImages.add(e);
    }
    update();
  }

  removeImage(index) {
    if (productImages.isNotEmpty) {
      productImages.removeAt(index);
      update();
    }
  }
}
