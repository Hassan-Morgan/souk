import 'package:get/get.dart';

class TextFormFieldController extends GetxController {
  bool isVisible = true;

  void changeTextVisibility() {
    isVisible = !isVisible;
    update();
  }
}
