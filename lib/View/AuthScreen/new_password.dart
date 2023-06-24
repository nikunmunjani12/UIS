import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uisapp/View/AuthScreen/verify_otp.dart';
import 'package:uisapp/View/AuthScreen/widget/common_elevated_button.dart';
import 'package:uisapp/View/AuthScreen/widget/common_text_field.dart';

import '../../Constant/common_color.dart';
import '../../Constant/common_text_style.dart';
import '../../Constant/height_width.dart';
import '../../Controller/variable.dart';
import 'login_screen.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.wightColor,
        leading: IconButton(
          onPressed: () {
            Get.to(const VerifyOtp());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: height * 0.033,
          ),
        ),
        title: Text('New Password', style: kBlackW500),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.075),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.040,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'set your new password',
                    style: TextStyle(
                        fontFamily: 'poly',
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * 0.022,
                ),
                CommonTextFieldAuth(
                    commonController: VariableController.newPassword,
                    commonHintText: 'Enter your password',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.025,
                ),
                CommonTextFieldAuth(
                    commonController: VariableController.confirmPassword,
                    commonHintText: 'Enter your confirm password',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.11,
                ),
                commonElevatedButton(() {
                  Get.to(const LoginScreen());
                }, 'Set Password')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
