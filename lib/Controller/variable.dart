import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class VariableController extends GetxController {
  ///login variable

  // static final emailLogin = TextEditingController();
  // static final passwordLogin = TextEditingController();

  ///register
  // static final nameRegister = TextEditingController();
  // static final emailRegister = TextEditingController();
  // static final passwordRegister = TextEditingController();
  // static final conFirmPassRegister = TextEditingController();

  /// forgotPassword

  static final emailForgot = TextEditingController();
  static final printedForgot = TextEditingController();

  ///newPassword

  static final newPassword = TextEditingController();
  static final confirmPassword = TextEditingController();

  ///verify

  static final verifyController = TextEditingController();

  // ///formPageOne/1
  //
  // static final nameForm1 = TextEditingController();
  // static final dateDeathForm1 = TextEditingController();
  // static final placeDeathForm1 = TextEditingController();
  // static final numberForm1 = TextEditingController();
  // static final dateAttForm1 = TextEditingController();
  // static final printedForm1 = TextEditingController();
  // static final signTureForm1 = TextEditingController();
  //
  // ///formPageTwo/2
  //
  // static final printedForm2 = TextEditingController();
  // static final signatureForm2 = TextEditingController();
  // static final dateTimeForm2 = TextEditingController();
  //
  // ///
  // static final printedFormAnd2 = TextEditingController();
  // static final signatureFormAnd2 = TextEditingController();
  // static final dateTimeFormAnd2 = TextEditingController();
  //
  // ///formPageThree/3
  //
  // static final printedForm3 = TextEditingController();
  // static final relationshipForm3 = TextEditingController();
  // static final signatureForm3 = TextEditingController();
  // static final dateTimeForm3 = TextEditingController();
  //
  // ///
  // static final printedFormAnd3 = TextEditingController();
  // static final signatureFormAnd3 = TextEditingController();
  // static final dateTimeFormAnd3 = TextEditingController();

  ///profileScreen

  static final profileName = TextEditingController();
  static final profileEmail = TextEditingController();
  static final profileNumber = TextEditingController();
  static final profileLocation = TextEditingController();

  static PageController controller = PageController();
}
