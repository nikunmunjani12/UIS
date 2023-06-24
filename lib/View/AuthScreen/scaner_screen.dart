import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uisapp/Constant/common_color.dart';
import 'package:uisapp/Constant/height_width.dart';

import '../../Constant/common_text_style.dart';
import '../HomeScreen/form.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wightColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.075),
          child: Column(
            children: [
              Center(
                child: InkResponse(
                  onTap: () {
                    Get.to(const FormUi());
                  },
                  child: Image.asset(
                    'assets/images/scanner.png',
                    height: height * 0.4,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Notice',
                  style: TextStyle(
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poly'),
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                height: height * 0.064,
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
                child: Center(
                    child: Text(
                  'Lorem Ipsum is simply dummy text of tha',
                  style: kGreyW500,
                )),
              ),
              SizedBox(height: height * 0.01),
              Container(
                height: height * 0.064,
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
                child: Center(
                  child: Text(
                    'Lorem Ipsum is simply dummy text of tha',
                    style: kGreyW500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
