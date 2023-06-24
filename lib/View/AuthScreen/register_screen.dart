import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uisapp/View/AuthScreen/widget/common_elevated_button.dart';
import 'package:uisapp/View/AuthScreen/widget/common_text_field.dart';

import '../../Api/Model/Response/signup_response_model.dart';
import '../../Api/api_response.dart';
import '../../Constant/common_color.dart';
import '../../Constant/common_text_style.dart';
import '../../Constant/height_width.dart';
import '../../ViewModel/sign_up_view_model.dart';
import '../Widget/bottom_navigation_bar.dart';
import '../Widget/home_images.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  SignUpViewModel signUpViewModel = Get.put(SignUpViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wightColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.075),
          child: Column(
            children: [
              SizedBox(height: height * 0.090),
              Image.asset(
                ImagePath.uisImage,
                height: height * 0.20,
              ),
              SizedBox(height: height * 0.035),
              Text('Sign up', style: kBlueW500),
              SizedBox(height: height * 0.050),
              CommonTextFieldAuth(
                  commonController: signUpViewModel.nameSignUp,
                  commonHintText: 'Enter your name',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(height: height * 0.02),
              CommonTextFieldAuth(
                  commonController: signUpViewModel.emailSignUp,
                  commonHintText: 'Enter your email',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(height: height * 0.02),
              CommonTextFieldAuth(
                  commonController: signUpViewModel.passwordSignUp,
                  commonHintText: 'Enter your password',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(height: height * 0.02),
              CommonTextFieldAuth(
                  commonController: signUpViewModel.confirmPasswordSignUp,
                  commonHintText: 'Enter your confirm password',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(height: height * 0.06),
              GetBuilder<SignUpViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.INITIAL ||
                      controller.apiResponse.status == Status.COMPLETE ||
                      controller.apiResponse.status == Status.ERROR) {
                    return commonElevatedButton(
                      () async {
                        await controller.signUpViewModel({
                          "name": signUpViewModel.nameSignUp.text,
                          "email": signUpViewModel.emailSignUp.text,
                          "password": signUpViewModel.passwordSignUp.text,
                          "cpassword":
                              signUpViewModel.confirmPasswordSignUp.text,
                        });

                        if (controller.apiResponse.status == Status.COMPLETE) {
                          SignUpResponseModel data =
                              controller.apiResponse.data;

                          if (data.status == "success") {
                            if (data.data.status == "pending") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${data.message}')));
                              buildDefaultDialog();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(data.message)));

                              ///get storage add userid
                              ///navigate to home
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(data.message)));
                          }
                        }
                      },
                      "Sign up",
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ", style: kGreyW500),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        const LoginScreen(),
                      );
                    },
                    child: Text("Login Now", style: kBRegisterW500),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//////////--USE DART_FILE--////////////

/// signup_response_model
/// api_response
/// sign_up_view_model
///Sign_Up_Repo//Use  //++++//  Sign_Up_View_Model

Future<dynamic> buildDefaultDialog() {
  return Get.defaultDialog(
    title: '',
    middleText: '',
    actions: [
      Text(
        textAlign: TextAlign.center,
        "Please wait until"
        "\nadmin approve"
        "\nyour profile",
        style: TextStyle(
            color: Colors.black,
            fontSize: height * 0.030,
            fontFamily: "Poly",
            fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.05),
        child: SizedBox(
          width: width * 0.3,
          child: commonElevatedButton(() {
            Get.to(const BottomNavigationBarScreen());
          }, 'ok'),
        ),
      ),
    ],
  );
}
