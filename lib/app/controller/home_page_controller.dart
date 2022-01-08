import 'package:get/get.dart';

class HomePageController extends GetxController {
  bool categoriesButtonSelected = false;
  bool categoriesMenuSelected = false;


  void changeButtonState(bool event, String name) {
    switch (name) {
      case 'categoriesButton':
        categoriesButtonSelected = true;
        update();
        break;
      case 'categoriesMenu':
        categoriesMenuSelected = event;
        categoriesButtonSelected = event;
        update();
        break;
      case 'homeButton':
        categoriesButtonSelected=false;
        update();
        break;
    }
  }
}
