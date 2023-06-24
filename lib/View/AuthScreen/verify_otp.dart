import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';
import 'package:uisapp/Controller/getx_contoller.dart';
import 'package:uisapp/Controller/variable.dart';
import 'package:uisapp/View/AuthScreen/widget/common_elevated_button.dart';

import '../../Constant/common_color.dart';
import '../../Constant/common_text_style.dart';
import '../../Constant/height_width.dart';
import 'forgot_password_number.dart';
import 'new_password.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String? otpSelected;
  GetControllerDemo demo = Get.put(GetControllerDemo());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetControllerDemo>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.wightColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.wightColor,
            leading: IconButton(
              onPressed: () {
                Get.to(const ForgotPassword());
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
                    SizedBox(height: height * 0.03),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'We sent an otp your mobile number\n515656555',
                        style: TextStyle(
                            fontFamily: 'poly',
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.040,
                    ),
                    Pinput(
                      length: 6,
                      controller: VariableController.verifyController,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        width: width * 0.14,
                        height: height * 0.080,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.03,
                        ),
                      ),
                      onSubmitted: (value) {
                        otpSelected = value;
                        controller.update();
                      },
                    ),
                    SizedBox(
                      height: height * 0.030,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not yet get? ',
                          style: kBlack20SW500,
                        ),
                        Text('Resend OTP', style: kBRegisterW500)
                      ],
                    ),
                    SizedBox(
                      height: height * 0.12,
                    ),
                    commonElevatedButton(() {
                      Get.to(const NewPassword());
                    }, 'Verify')
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
