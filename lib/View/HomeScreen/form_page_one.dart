import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uisapp/Api/Model/Response/get_single_form_response_model.dart';
import 'package:uisapp/Constant/date_picker.dart';
import 'package:uisapp/Controller/form.dart';
import 'package:uisapp/ViewModel/get_single_form_view_model.dart';
import 'package:uisapp/Api/api_response.dart' as st;
import '../../Constant/height_width.dart';
import '../AuthScreen/widget/common_elevated_button.dart';
import '../AuthScreen/widget/common_text_field.dart';

class FormPageOne extends StatefulWidget {
  const FormPageOne({Key? key}) : super(key: key);

  @override
  State<FormPageOne> createState() => _FormPageOneState();
}

class _FormPageOneState extends State<FormPageOne> {
  GetSingleFormsViewModel singleFormsViewModel =
      Get.put(GetSingleFormsViewModel());

  DateFormat format = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: GetBuilder<GetSingleFormsViewModel>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.072),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.028,
              ),
              CommonTextFieldAuth(
                  commonController: singleFormsViewModel.nameForm1,
                  commonHintText: 'Name of tha Deceased',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(
                height: height * 0.022,
              ),
              CommonTextFieldAuth(
                  sufixIcon: AbCd.datePicker(
                      context, singleFormsViewModel.dateDeathForm1),
                  commonController: singleFormsViewModel.dateDeathForm1,
                  commonHintText: 'Date of Death',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(
                height: height * 0.022,
              ),
              CommonTextFieldAuth(
                  commonController: singleFormsViewModel.placeDeathForm1,
                  commonHintText: 'Place of Death',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(
                height: height * 0.022,
              ),
              CommonTextFieldAuth(
                  commonController: singleFormsViewModel.numberForm1,
                  commonHintText: 'Number on the UIS Bracelet',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(
                height: height * 0.022,
              ),
              CommonTextFieldAuth(
                  commonController: singleFormsViewModel.dateAttForm1,
                  commonHintText: 'Date/Time Attached',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(
                height: height * 0.032,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name of Person Securing tha UIS on tha Deceased\n(Place tha Bracelet on tha ankle of the deceased)',
                  style: TextStyle(
                      fontFamily: 'poly',
                      fontSize: height * 0.018,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: height * 0.022,
              ),
              CommonTextFieldAuth(
                  commonController: singleFormsViewModel.printedForm1,
                  commonHintText: 'Printed',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(
                height: height * 0.022,
              ),
              CommonTextFieldAuth(
                  commonController: singleFormsViewModel.signTureForm1,
                  commonHintText: 'Signature',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(
                height: height * 0.070,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: width * 0.3,
                  child: commonElevatedButton(() {
                    NextPage.next();
                  }, 'Next'),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:universal_identification_system/Constants/test_style.dart';
// import 'package:universal_identification_system/Controller/forms.dart';
// import 'package:universal_identification_system/View/Widget/elevated_button.dart';
// import 'package:universal_identification_system/View/Widget/text_field.dart';
// import 'package:universal_identification_system/ViewModel/single_form_view_model.dart';
//
// /// form number 1
// class FormPageOne extends StatefulWidget {
//   const FormPageOne({Key? key}) : super(key: key);
//
//   @override
//   State<FormPageOne> createState() => _FormPageOneState();
// }
//
// class _FormPageOneState extends State<FormPageOne> {
//   final _formKey = GlobalKey<FormState>();
//
//   FormControllers formControllers = Get.put(FormControllers());
//   SingleFormViewModel singleFormViewModel = Get.find<SingleFormViewModel>();
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SingleFormViewModel>(
//       builder: (controller) {
//         return Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CommonTextFormField(
//                 keyboardType: TextInputType.name,
//                 hintText: "Name of the Deceased",
//                 controller: singleFormViewModel.nameOfTheDeceasedForm1,
//               ),
//               SizedBox(height: 14.h),
//               GetBuilder<FormControllers>(
//                 builder: (formController) {
//                   return CommonTextFormField(
//                     keyboardType: TextInputType.number,
//                     hintText: "Date of Death",
//                     controller: singleFormViewModel.dateOfDeathForm1,
//                     suffixIcon: formControllers.calendarIconButton(
//                       context,
//                       singleFormViewModel.dateOfDeathForm1,
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 14.h),
//               CommonTextFormField(
//                 keyboardType: TextInputType.name,
//                 hintText: "Place of Death",
//                 controller: singleFormViewModel.placeOfDeathForm1,
//               ),
//               SizedBox(height: 14.h),
//               CommonTextFormField(
//                 keyboardType: TextInputType.name,
//                 hintText: "Number on the UIS Bracelet",
//                 controller: singleFormViewModel.numberOnTheUISBraceletForm1,
//               ),
//               SizedBox(height: 14.h),
//               CommonTextFormField(
//                 keyboardType: TextInputType.name,
//                 hintText: "Date/Time Attached",
//                 controller: singleFormViewModel.dateTimeAttachedForm1,
//               ),
//               SizedBox(height: 35.h),
//               Text(
//                 "Name of Person Securing the UIS on the Deceased"
//                     "\n(Place the Bracelet on the ankle of the deceased)",
//                 style: FontTextStyle.k00000016W400,
//               ),
//               SizedBox(height: 14.h),
//               CommonTextFormField(
//                 keyboardType: TextInputType.name,
//                 hintText: "Printed",
//                 controller: singleFormViewModel.printedForm1,
//               ),
//               SizedBox(height: 14.h),
//               CommonTextFormField(
//                 keyboardType: TextInputType.name,
//                 hintText: "Signature",
//                 controller: singleFormViewModel.signatureForm1,
//               ),
//               SizedBox(height: 84.h),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: CommonElevatedSmallButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       FormControllers.nextPage();
//                     }
//                   },
//                   text: "Next",
//                 ),
//               ),
//               SizedBox(height: 34.h),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
