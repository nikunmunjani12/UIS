import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uisapp/Api/Model/Response/login_response_model.dart';
import 'package:uisapp/Constant/height_width.dart';
import 'package:uisapp/Controller/variable.dart';
import 'package:uisapp/View/AuthScreen/register_screen.dart';
import 'package:uisapp/View/AuthScreen/widget/common_elevated_button.dart';
import 'package:uisapp/View/AuthScreen/widget/common_text_field.dart';
import 'package:uisapp/ViewModel/login_view_model.dart';

import '../../Api/api_response.dart';
import '../../Constant/common_color.dart';
import '../../Constant/common_text_style.dart';
import '../Widget/bottom_navigation_bar.dart';
import '../Widget/home_images.dart';
import 'forgot_password_number.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = Get.put(LoginViewModel());
  final box =  GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wightColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.075),
          child: Column(
            children: [
              SizedBox(height: height * 0.11),
              Image.asset(
                ImagePath.uisImage,
                height: height * 0.20,
              ),
              SizedBox(height: height * 0.040),
              Text('Login', style: kYellowW500),
              SizedBox(height: height * 0.0040),
              Text('Welcome back!', style: kBlueW500),
              SizedBox(height: height * 0.050),
              CommonTextFieldAuth(
                  commonController: loginViewModel.emailLogin,
                  commonHintText: 'Enter your email',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              SizedBox(height: height * 0.02),
              CommonTextFieldAuth(
                  commonController: loginViewModel.passwordLogin,
                  commonHintText: 'Enter your password',
                  commonKeyboardType: TextInputType.name,
                  commonOnPressed: () {}),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Get.to(const ForgotPassword());
                  },
                  child: Text('Forgot Password?', style: kGreyW500),
                ),
              ),
              SizedBox(height: height * 0.05),
              GetBuilder<LoginViewModel>(
                builder: (controller) {
                  if (controller.apiResponseLogin.status == Status.INITIAL ||
                      controller.apiResponseLogin.status == Status.COMPLETE ||
                      controller.apiResponseLogin.status == Status.ERROR) {
                    return commonElevatedButton(
                      () async {
                        await controller.loginViewModel({
                          'email': loginViewModel.emailLogin.text,
                          'password': loginViewModel.passwordLogin.text,
                        });
                        if (controller.apiResponseLogin.status ==
                            Status.COMPLETE) {
                          LoginResponseModel data =
                              controller.apiResponseLogin.data;

                          if (data.status == "success") {
                            if (data.status == "pending") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${data.message}')));
                              ///////////////////////////////
                              // Get.to(BottomNavigationBarScreen());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(data.message)));

                              ///get storage add userid
                              ///navigate to home
                              Get.to(const BottomNavigationBarScreen());
                            }
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(content: Text(data.message)));
                          } else {
                            print('error');
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(data.message)));
                          }
                        }
                      },
                      "Login",
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
                  Text("Don't have an account?", style: kGreyW500),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        const RegisterScreen(),
                      );
                    },
                    child: Text("Register Now", style: kBRegisterW500),
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
