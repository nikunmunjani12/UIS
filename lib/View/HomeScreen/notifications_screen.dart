import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uisapp/Constant/common_color.dart';
import 'package:uisapp/Controller/getx_contoller.dart';

import '../../Constant/height_width.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  GetControllerDemo getController1 = Get.put(GetControllerDemo());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetControllerDemo>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.wightColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  10,
                  (index) => Center(
                    child: Container(
                      height: height * 0.066,
                      width: width * 0.88,
                      margin: EdgeInsets.symmetric(vertical: height * 0.008),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1, 1),
                              blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: width * 0.02),
                          Container(
                            height: height * 0.050,
                            width: height * 0.050,
                            decoration: BoxDecoration(
                              color: AppColor.blueColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.notifications_none_sharp,
                              color: AppColor.wightColor,
                              size: height * 0.030,
                            ),
                          ),
                          SizedBox(width: width * 0.023),
                          Text(
                            'Lorem Ipsum simply dummy of the\ntext of thees of tha',
                            style: TextStyle(
                              color: AppColor.greyColor,
                              fontSize: height * 0.018,
                              fontFamily: 'poly',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: height * 0.026, right: width * 0.02),
                            child: Text(
                              '2min',
                              style: TextStyle(
                                color: AppColor.greyColor,
                                fontSize: height * 0.016,
                                fontFamily: 'poly',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
