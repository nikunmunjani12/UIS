import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uisapp/Api/Repo/get_single_form_repo.dart';
import '../Api/Model/Response/get_single_form_response_model.dart';
import '../Api/api_response.dart';

class GetSingleFormsViewModel extends GetxController {
  final box = GetStorage();
  ApiResponse _apiResponseGetSingle =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponseGetSingle => _apiResponseGetSingle;

  ///formPageOne/1

  final nameForm1 = TextEditingController();
  final dateDeathForm1 = TextEditingController();
  final placeDeathForm1 = TextEditingController();
  final numberForm1 = TextEditingController();
  final dateAttForm1 = TextEditingController();
  final printedForm1 = TextEditingController();
  final signTureForm1 = TextEditingController();

  ///formPageTwo/2

  final printedForm2 = TextEditingController();
  final signatureForm2 = TextEditingController();
  final dateTimeForm2 = TextEditingController();

  ///
  final printedFormAnd2 = TextEditingController();
  final signatureFormAnd2 = TextEditingController();
  final dateTimeFormAnd2 = TextEditingController();

  ///formPageThree/3

  final printedForm3 = TextEditingController();
  final relationshipForm3 = TextEditingController();
  final signatureForm3 = TextEditingController();
  final dateTimeForm3 = TextEditingController();

  ///
  final printedFormAnd3 = TextEditingController();
  final signatureFormAnd3 = TextEditingController();
  final dateTimeFormAnd3 = TextEditingController();

  Future<void> getSingleFormsViewModel() async {
    _apiResponseGetSingle = ApiResponse.loading(message: 'Loading');

    update();
    try {
      GetSingleResponseModel response =
          await GetSingleFormsRepo.getSingleFormRepo(
        box.read("userId"),
        box.read("formID"),
      );

      _apiResponseGetSingle = ApiResponse.complete(response);
      // nameForm1.text = response.data.countryId.toString();

//      nameOfTheDeceasedForm1.text = response.data.countryId.toString();
      nameForm1.text = response.data.deceasedName;
//       dateOfDeathForm1.text = response.data.dateOfDeath.toString();
//       placeOfDeathForm1.text = response.data.placeOfDeath.toString();
//       numberOnTheUISBraceletForm1 = response.data.numberOnUisBand;
//       dateTimeAttachedForm1.text = response.data.dateTimeAttached.toString();
//       printedForm1.text = response.data.nameSecuringBand.toString();
//       signatureForm1.text =
//           response.data.nameOfPersonReleasingCrematedRemainsDt.toString();

      log('getSingleFormsResponseModel------response------>>>>>>$response');
    } catch (e) {
      _apiResponseGetSingle = ApiResponse.error(message: e.toString());

      log('getSingleFormsViewModel-------->>>>>>$e');
    }
    update();
  }
}
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:universal_identification_system/Api/Repo/single_form_repo.dart';
// import 'package:universal_identification_system/Api/api_response.dart';
// import 'package:universal_identification_system/Model/Response/single_form_response_model.dart';
//
// class SingleFormViewModel extends GetxController {
//   final box = GetStorage();
//
//   ApiResponse _apiResponseSingleForm =
//   ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get apiResponse => _apiResponseSingleForm;
//
//   /// form 1
//
//   TextEditingController nameOfTheDeceasedForm1 = TextEditingController();
//   TextEditingController dateOfDeathForm1 = TextEditingController();
//   TextEditingController placeOfDeathForm1 = TextEditingController();
//   TextEditingController numberOnTheUISBraceletForm1 = TextEditingController();
//   TextEditingController dateTimeAttachedForm1 = TextEditingController();
//   TextEditingController printedForm1 = TextEditingController();
//   TextEditingController signatureForm1 = TextEditingController();
//
//   /// form 2
//
//   TextEditingController funeralPrintedForm2 = TextEditingController();
//   TextEditingController funeralSignatureForm2 = TextEditingController();
//   TextEditingController funeralDateTimeForm2 = TextEditingController();
//   TextEditingController crematoryPrintedForm2 = TextEditingController();
//   TextEditingController crematorySignatureForm2 = TextEditingController();
//   TextEditingController crematoryDateTimeForm2 = TextEditingController();
//
//   /// form 3
//
//   TextEditingController printedReceiveForm3 = TextEditingController();
//   TextEditingController relationshipReceiveForm3 = TextEditingController();
//   TextEditingController signatureReceiveForm3 = TextEditingController();
//   TextEditingController dateTimeReceiveForm3 = TextEditingController();
//   TextEditingController printedReleasingForm3 = TextEditingController();
//   TextEditingController signatureReleasingForm3 = TextEditingController();
//   TextEditingController dateTimeReleasingForm3 = TextEditingController();
//
//   Future<void> singleFormViewModel() async {
//     _apiResponseSingleForm = ApiResponse.loading(message: 'Loading');
//
//     update();
//     try {
//       SingleFormResponseModel response = await SingleFormsRepo.singleFormsRepo(
//         box.read("userId"),
//         box.read("formID"),
//       );
//
//       _apiResponseSingleForm = ApiResponse.complete(response);
//
//       ///form 1
//
//       nameOfTheDeceasedForm1.text = response.data.countryId.toString();
//       nameOfTheDeceasedForm1 = response.data.deceasedName;
//       dateOfDeathForm1.text = response.data.dateOfDeath.toString();
//       placeOfDeathForm1.text = response.data.placeOfDeath.toString();
//       numberOnTheUISBraceletForm1 = response.data.numberOnUisBand;
//       dateTimeAttachedForm1.text = response.data.dateTimeAttached.toString();
//       printedForm1.text = response.data.nameSecuringBand.toString();
//       signatureForm1.text =
//           response.data.nameOfPersonReleasingCrematedRemainsDt.toString();
//
//       /// form 2
//       //
//       // funeralPrintedForm2 = TextEditingController(
//       //     text: response
//       //         .data.nameFuneralDirectorOtherRepresentativeTakingCustodyEsign);
//       // funeralSignatureForm2 = TextEditingController(
//       //     text: response
//       //         .data.nameFuneralDirectorOtherRepresentativeTakingCustodyEsign);
//       // funeralDateTimeForm2 = TextEditingController(
//       //     text: response
//       //         .data.nameFuneralDirectorOtherRepresentativeTakingCustodyDt
//       //         .toString());
//       // crematoryPrintedForm2 = TextEditingController(
//       //     text: response
//       //         .data.nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign);
//       // crematorySignatureForm2 = TextEditingController(
//       //     text: response
//       //         .data.nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign);
//       // crematoryDateTimeForm2 = TextEditingController(
//       //     text:
//       //         response.data.nameOfPersonReleasingCrematedRemainsDt.toString());
//
//       /// form 3
//
//       // printedReceiveForm3 = TextEditingController(
//       //     text: response.data.nameOfPersonEntitledToReceiveCrematedRemainsDt
//       //         .toString());
//       // relationshipReceiveForm3 = TextEditingController(
//       //     text: response
//       //         .data.nameOfPersonEntitledToReceiveCrematedRemainsRelationship);
//       // signatureReceiveForm3 = TextEditingController(
//       //     text:
//       //         response.data.nameOfPersonEntitledToReceiveCrematedRemainsEsign);
//       // dateTimeReceiveForm3 = TextEditingController(
//       //     text: response.data.dateTimeAttached.toString());
//       // printedReleasingForm3 = TextEditingController(
//       //     text: response
//       //         .data.nameOfPersonEntitledToReceiveCrematedRemainsRelationship);
//       // signatureReleasingForm3 = TextEditingController(
//       //     text: response.data.nameOfPersonReleasingCrematedRemainsEsign);
//       // dateTimeReleasingForm3 = TextEditingController(
//       //     text: response.data.dateTimeAttached.toString());
//
//       ///
//
//       log('singleFormResponseModel----response---->>>>>>$response');
//     } catch (e) {
//       _apiResponseSingleForm = ApiResponse.error(message: e.toString());
//
//       log('singleFormViewModel-------->>>>>>$e');
//     }
//     update();
//   }
// }
