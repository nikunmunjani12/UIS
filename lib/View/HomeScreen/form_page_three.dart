import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hand_signature/signature.dart';
import 'package:uisapp/Constant/date_picker.dart';
import 'package:uisapp/Controller/form.dart';
import '../../Constant/common_text_style.dart';
import '../../Constant/height_width.dart';
import '../../ViewModel/get_single_form_view_model.dart';
import '../AuthScreen/widget/common_elevated_button.dart';
import '../AuthScreen/widget/common_text_field.dart';

class FormPageThree extends StatefulWidget {
  const FormPageThree({Key? key}) : super(key: key);

  @override
  State<FormPageThree> createState() => _FormPageThreeState();
}

class _FormPageThreeState extends State<FormPageThree> {
  GetSingleFormsViewModel getSingleFormsViewModel =
      Get.find<GetSingleFormsViewModel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetSingleFormsViewModel>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.072),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.022,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name of Person entitled to receive the cremated\nremains',
                    style: TextStyle(
                        fontFamily: 'poly',
                        fontSize: height * 0.019,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * 0.024,
                ),
                CommonTextFieldAuth(
                    commonController: getSingleFormsViewModel.printedForm3,
                    commonHintText: 'printed',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    commonController: getSingleFormsViewModel.relationshipForm3,
                    commonHintText: 'Relationship',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    commonController: getSingleFormsViewModel.signatureForm3,
                    commonHintText: 'Signature',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    sufixIcon: AbCd.datePicker(
                        context, getSingleFormsViewModel.dateTimeForm3),
                    commonController: getSingleFormsViewModel.dateTimeForm3,
                    commonHintText: 'Date/Time',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.027,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name of Person releasing cremated remains',
                    style: TextStyle(
                        fontFamily: 'poly',
                        fontSize: height * 0.019,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    commonController: getSingleFormsViewModel.printedFormAnd3,
                    commonHintText: 'Printed',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    commonController: getSingleFormsViewModel.signatureFormAnd3,
                    commonHintText: 'Signature',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    sufixIcon: AbCd.datePicker(
                        context, getSingleFormsViewModel.dateTimeFormAnd3),
                    commonController: getSingleFormsViewModel.dateTimeFormAnd3,
                    commonHintText: 'Date/Time',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.018,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Upload Photo',
                    style: kBlackSW500,
                  ),
                ),
                SizedBox(
                  height: height * 0.018,
                ),
                CommonTextFieldAuth(
                    // commonController: VariableController.signature,
                    commonHintText: 'Choose file',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.030,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      width: width * 0.27,
                      child: commonElevatedButton2(() {
                        buildDefaultDialog();
                      }, 'Ensign')),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Row(
                  children: [
                    commonOutlinedButton(() {
                      NextPage.previous();
                    }, 'Previous'),
                    const Spacer(),
                    SizedBox(
                      width: width * 0.3,
                      child: commonElevatedButton(() {}, 'Submit'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.050,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<dynamic> buildDefaultDialog() {
  return Get.generalDialog(
    pageBuilder: (context, animation, secondaryAnimation) {
      final control = HandSignatureControl(
        threshold: 3.0,
        smoothRatio: 0.65,
        velocityRange: 2.0,
      );
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.26,
              width: width * 0.61,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: HandSignature(
                control: control,
                color: Colors.blueGrey,
                type: SignatureDrawType.shape,
              ),
            ),
            SizedBox(height: height * 0.03),
            SizedBox(
              width: width * 0.3,
              child: commonElevatedButton(() {
                Get.back();
              }, 'Save'),
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              width: width * 0.21,
              child: commonElevatedButton2(() {
                control.clear();
              }, 'Redo'),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      );
    },
  );
}
