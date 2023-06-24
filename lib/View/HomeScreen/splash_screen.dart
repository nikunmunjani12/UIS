import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uisapp/Constant/common_color.dart';
import 'package:uisapp/Constant/height_width.dart';

import '../AuthScreen/login_screen.dart';
import '../Widget/bottom_navigation_bar.dart';
import '../Widget/home_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(
          () => box.read('userId') == null
              ? const LoginScreen()
              : const BottomNavigationBarScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wightColor,
      body: Center(
        child: Image.asset(
          ImagePath.uisImage,
          height: height * 0.21,
        ),
      ),
    );
  }
}
