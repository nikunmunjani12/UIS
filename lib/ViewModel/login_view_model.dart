import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../Api/Model/Response/login_response_model.dart';
import '../Api/Repo/login_repo.dart';
import '../Api/api_response.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final box = GetStorage();
  ApiResponse _apiResponseLogin =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponseLogin => _apiResponseLogin;
  final emailLogin = TextEditingController();
  final passwordLogin = TextEditingController();

  Future<void> loginViewModel(Map<String, dynamic> body) async {
    _apiResponseLogin = ApiResponse.loading(message: 'Loading');
    update();
    try {
      LoginResponseModel response = await LoginRepo().loginRepo(body: body);

      _apiResponseLogin = ApiResponse.complete(response);

      box.write('userId', response.data!.userId.toString());
      log('==LoginResponseModel=>$response');
    } catch (e) {
      _apiResponseLogin = ApiResponse.error(message: e.toString());
      log(".........   $e");
    }
    update();
  }
}
