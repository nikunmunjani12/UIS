import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uisapp/Constant/common_color.dart';
import 'package:uisapp/Controller/variable.dart';

import '../../Constant/height_width.dart';
import '../../Controller/getx_contoller.dart';
import '../AuthScreen/widget/common_elevated_button.dart';
import '../AuthScreen/widget/common_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final box = GetStorage();
  GetControllerDemo getController1 = Get.put(GetControllerDemo());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetControllerDemo>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.wightColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.075),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.009),
                    const Divider(),
                    SizedBox(height: height * 0.025),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: height * 0.15,
                          width: height * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.cyan.shade200,
                              shape: BoxShape.circle),
                        ),
                        Positioned(
                          bottom: 00,
                          right: 00,
                          child: Container(
                            height: height * 0.043,
                            width: height * 0.043,
                            decoration: const BoxDecoration(
                                color: AppColor.blueColor,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.edit,
                              size: height * 0.024,
                              color: AppColor.wightColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.060),
                    CommonTextFieldAuth(
                        commonController: VariableController.profileName,
                        commonHintText: 'Enter your name',
                        commonKeyboardType: TextInputType.name,
                        commonOnPressed: () {}),
                    SizedBox(height: height * 0.023),
                    CommonTextFieldAuth(
                        commonController: VariableController.profileEmail,
                        commonHintText: 'Enter your email',
                        commonKeyboardType: TextInputType.name,
                        commonOnPressed: () {}),
                    SizedBox(height: height * 0.023),
                    CommonTextFieldAuth(
                        commonController: VariableController.profileNumber,
                        commonHintText: 'Enter your phone number',
                        commonKeyboardType: TextInputType.name,
                        commonOnPressed: () {}),
                    SizedBox(height: height * 0.023),
                    CommonTextFieldAuth(
                        commonController: VariableController.profileLocation,
                        commonHintText: 'Enter your location',
                        commonKeyboardType: TextInputType.name,
                        commonOnPressed: () {}),
                    SizedBox(height: height * 0.080),
                    commonElevatedButton(() {
                    }, 'Save'),
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
