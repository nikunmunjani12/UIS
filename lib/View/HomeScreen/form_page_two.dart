import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uisapp/Controller/form.dart';

import '../../Constant/date_picker.dart';
import '../../Constant/height_width.dart';
import '../../ViewModel/get_single_form_view_model.dart';
import '../AuthScreen/widget/common_elevated_button.dart';
import '../AuthScreen/widget/common_text_field.dart';

class FormPageTwo extends StatefulWidget {
  const FormPageTwo({Key? key}) : super(key: key);

  @override
  State<FormPageTwo> createState() => _FormPageTwoState();
}

class _FormPageTwoState extends State<FormPageTwo> {
  GetSingleFormsViewModel getSingleFormsViewModel =
      Get.find<GetSingleFormsViewModel>();

  var selected;
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
                  height: height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name of Funeral/Other Representative Taking\nCustody of the Deceased',
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
                    commonController: getSingleFormsViewModel.printedForm2,
                    commonHintText: 'Printed',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    commonController: getSingleFormsViewModel.signatureForm2,
                    commonHintText: 'Signature',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.02,
                ),
                CommonTextFieldAuth(
                    sufixIcon: AbCd.datePicker(
                        context, getSingleFormsViewModel.dateTimeForm2),
                    commonController: getSingleFormsViewModel.dateTimeForm2,
                    commonHintText: 'Date/Time',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.035,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name of Crematory/Cemetery Representative Taking\nCustody of tha Deceased',
                    style: TextStyle(
                        fontFamily: 'poly',
                        fontSize: height * 0.017,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    commonController: getSingleFormsViewModel.printedFormAnd2,
                    commonHintText: 'Printed',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    commonController: getSingleFormsViewModel.signatureFormAnd2,
                    commonHintText: 'Signature',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    sufixIcon: AbCd.datePicker(
                        context, getSingleFormsViewModel.dateTimeFormAnd2),
                    commonController: getSingleFormsViewModel.dateTimeFormAnd2,
                    commonHintText: 'Date/Time',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.080,
                ),
                Row(
                  children: [
                    commonOutlinedButton(() {
                      NextPage.previous();
                    }, 'Previous'),
                    const Spacer(),
                    SizedBox(
                      width: width * 0.3,
                      child: commonElevatedButton(() {
                        NextPage.next();
                      }, 'Next'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
