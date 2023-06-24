import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:uisapp/Controller/variable.dart';

class NextPage extends GetxController {
  static next() {
    VariableController.controller.nextPage(
      duration: const Duration(milliseconds: 5),
      curve: Curves.bounceIn,
    );
  }

  static previous() {
    VariableController.controller.previousPage(
      duration: const Duration(milliseconds: 5),
      curve: Curves.bounceInOut,
    );
  }
}
