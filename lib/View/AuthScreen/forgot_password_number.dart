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

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.wightColor,
        leading: IconButton(
          onPressed: () {
            Get.to(LoginScreen());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: height * 0.033,
          ),
        ),
        title: Text('Forgot Password', style: kBlackW500),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.075),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your email or phone number &\nwill send you instruction on hoe to reset\nit.',
                    style: TextStyle(
                        fontFamily: 'poly',
                        fontSize: height * 0.022,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * 0.041,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email', style: kBlack20SW500)),
                SizedBox(
                  height: height * 0.013,
                ),
                CommonTextFieldAuth(
                    commonController: VariableController.emailForgot,
                    commonHintText: 'Email',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.030,
                ),
                Text(
                  'or',
                  style: kBlackSW500,
                ),
                SizedBox(
                  height: height * 0.040,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Mobile Number',
                    style: kBlack20SW500,
                  ),
                ),
                SizedBox(
                  height: height * 0.013,
                ),
                CommonTextFieldAuth(
                    commonController: VariableController.printedForgot,
                    commonHintText: 'Printed',
                    commonKeyboardType: TextInputType.name,
                    commonOnPressed: () {}),
                SizedBox(
                  height: height * 0.090,
                ),
                commonElevatedButton(() {
                  Get.to(const VerifyOtp());
                }, 'Sent')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
