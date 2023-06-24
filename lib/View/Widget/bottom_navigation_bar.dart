import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:uisapp/Constant/common_color.dart';
import 'package:uisapp/Constant/height_width.dart';
import 'package:uisapp/Controller/getx_contoller.dart';
import 'package:uisapp/View/AuthScreen/login_screen.dart';

import '../../Constant/common_text_style.dart';
import '../AuthScreen/scaner_screen.dart';
import '../HomeScreen/history_screen.dart';
import '../HomeScreen/notifications_screen.dart';
import '../HomeScreen/profile_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final box = GetStorage();
  List pageName = [
    const ScannerScreen(),
    const NotificationScreen(),
    const HistoryScreen(),
    const ProfileScreen()
  ];
  List statusBarName = ['', 'Notifications', 'History', 'My Profile'];
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
            leading: controller.select == 0
                ? Icon(
                    Icons.menu,
                    color: Colors.black,
                  )
                : IconButton(
                    onPressed: () {
                      controller.updateValue(0);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: height * 0.033,
                    ),
                  ),
            title: controller.select == 0
                ? Image.asset(
                    'assets/images/logo.png',
                    height: height * 0.050,
                  )
                : Text(statusBarName[controller.select], style: kBlackW500),
            centerTitle: true,
            actions: [
              controller.select == 3
                  ? Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            box.remove('userId');
                            Get.to(const LoginScreen());
                          });
                        },
                        icon: Icon(
                          Icons.login_outlined,
                          color: Colors.red,
                          size: height * 0.03,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          body: pageName[controller.select],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(27),
              topRight: Radius.circular(27),
            ),
            child: SalomonBottomBar(
              selectedItemColor: AppColor.blueColor,
              unselectedItemColor: const Color(0xffD9BB97),
              currentIndex: controller.select,
              onTap: (value) {
                controller.updateValue(value);
              },
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: height * 0.03,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(
                      fontFamily: "poly",
                      fontSize: height * 0.016,
                    ),
                  ),
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.notifications_none,
                    size: height * 0.03,
                  ),
                  title: Text(
                    "Notification",
                    style: TextStyle(
                      fontFamily: "poly",
                      fontSize: height * 0.015,
                    ),
                  ),
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.history,
                    size: height * 0.03,
                  ),
                  title: Text(
                    "history",
                    style: TextStyle(
                      fontFamily: "poly",
                      fontSize: height * 0.016,
                    ),
                  ),
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.person,
                    size: height * 0.03,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      fontFamily: "poly",
                      fontSize: height * 0.016,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
