import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Api/Model/Response/get_all_form_response_model.dart';
import '../Api/Repo/get_all_form_repo.dart';
import '../Api/api_response.dart';

class GetAllFormsViewModel extends GetxController {
  final box = GetStorage();
  ApiResponse _apiResponseGetAllForms =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponseGetAllForms;

  Future<void> getAllFormsViewModel() async {
    _apiResponseGetAllForms = ApiResponse.loading(message: 'Loading');

    update();
    try {
      GetAllFormsResponseModel1 response = await GetAllFormsRepo.getAllFormRepo(
        box.read("userId"),
      );

      _apiResponseGetAllForms = ApiResponse.complete(response);

      log('getAllFormsResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseGetAllForms = ApiResponse.error(message: e.toString());

      log('getAllFormsViewModel-------->>>>>>$e');
    }

    update();
  }
}
// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:universal_identification_system/Api/Repo/all_forms_repo.dart';
// import 'package:universal_identification_system/Api/api_response.dart';
// import 'package:universal_identification_system/Model/Response/all_forms_response_model.dart';
//
// class AllFormsViewModel extends GetxController {
//   final box = GetStorage();
//
//   ApiResponse _apiResponseAllForms =
//   ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get apiResponse => _apiResponseAllForms;
//
//   Future<void> allFormsViewModel() async {
//     _apiResponseAllForms = ApiResponse.loading(message: 'Loading');
//
//     update();
//     try {
//       AllFormsResponseModel response = await AllFormsRepo.allFormRepo(
//         box.read("userId"),
//       );
//
//       _apiResponseAllForms = ApiResponse.complete(response);
//
//       log('allFormsResponseModel----response---->>>>>>$response');
//     } catch (e) {
//       _apiResponseAllForms = ApiResponse.error(message: e.toString());
//
//       log('allFormsViewModel-------->>>>>>$e');
//     }
//     update();
//   }
// }
