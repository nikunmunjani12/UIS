import 'package:get/get.dart';

class GetControllerDemo extends GetxController {
  int select = 0;
  updateValue(value) {
    select = value;
    update();
  }
}
