import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:uisapp/Constant/common_color.dart';
import 'package:uisapp/Constant/height_width.dart';
import 'package:uisapp/Controller/variable.dart';
import 'package:uisapp/ViewModel/get_single_form_view_model.dart';
import 'package:uisapp/Api/api_response.dart' as sta;
import '../../Constant/common_text_style.dart';
import '../HomeScreen/form_page_one.dart';
import '../HomeScreen/form_page_three.dart';
import '../HomeScreen/form_page_two.dart';
import '../Widget/bottom_navigation_bar.dart';

class FormUi extends StatefulWidget {
  const FormUi({Key? key, this.id}) : super(key: key);
  final id;
  @override
  State<FormUi> createState() => _FormUiState();
}

class _FormUiState extends State<FormUi> {
  final box = GetStorage();
  int selected = 0;
  List pageName = [
    const FormPageOne(),
    const FormPageTwo(),
    const FormPageThree()
  ];
  GetSingleFormsViewModel singleFormsViewModel =
      Get.put(GetSingleFormsViewModel());
  @override
  void initState() {
    // TODO: implement initState
    singleFormsViewModel.getSingleFormsViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetSingleFormsViewModel>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.wightColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.wightColor,
            leading: IconButton(
              onPressed: () {
                Get.to(const BottomNavigationBarScreen());
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            actions: [
              selected == 2
                  ? Padding(
                      padding: EdgeInsets.only(right: width * 0.07),
                      child: SizedBox(
                        height: height * 0.045,
                        width: height * 0.045,
                        child: Image.asset(
                          'assets/images/icon.png',
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
            title: Text('Form', style: kBlackW500),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Container(
                        height: height * 0.003,
                        width: width * 0.27,
                        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                        color: selected >= index
                            ? Colors.indigo.withOpacity(0.8)
                            : Colors.grey.withOpacity(0.4)),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: VariableController.controller,
                    onPageChanged: (value) {
                      selected = value;
                      controller.update();
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GetBuilder<GetSingleFormsViewModel>(
                        builder: (controller) {
                          if (controller.apiResponseGetSingle.status ==
                              sta.Status.COMPLETE) {
                            return pageName[index];
                          } else if (controller.apiResponseGetSingle.status ==
                              sta.Status.LOADING) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (controller.apiResponseGetSingle.status ==
                              sta.Status.ERROR) {
                            return const Center(child: Text('ERROR'));
                          } else {
                            return const Center(
                                child: Text("SOMETHING WENT WRONG"));
                          }
                        },
                      );
                    },
                  ),
                ),
                //   itemBuilder: (context, index) {
              ],
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:universal_identification_system/Api/status.dart';
// import 'package:universal_identification_system/Constants/color.dart';
// import 'package:universal_identification_system/Constants/test_style.dart';
// import 'package:universal_identification_system/Controller/variable.dart';
// import 'package:universal_identification_system/Model/Response/login_response_model.dart';
// import 'package:universal_identification_system/View/HomeScreen/bottom_bar.dart';
// import 'package:universal_identification_system/View/HomeScreen/death_certificate.dart';
// import 'package:universal_identification_system/View/HomeScreen/form_page_one.dart';
// import 'package:universal_identification_system/View/HomeScreen/form_page_three.dart';
// import 'package:universal_identification_system/View/HomeScreen/form_page_two.dart';
// import 'package:universal_identification_system/View/Widget/icon_button.dart';
// import 'package:universal_identification_system/ViewModel/single_form_view_model.dart';
//
// class FormScreen extends StatefulWidget {
//   const FormScreen({Key? key, this.id}) : super(key: key);
//   final id;
//
//   @override
//   State<FormScreen> createState() => _FormScreenState();
// }
//
// class _FormScreenState extends State<FormScreen> {
//   final box = GetStorage();
//   List formPage = [
//     const FormPageOne(),
//     const FormPageTwo(),
//     const FormPageThree(),
//   ];
//
//   int selected = 0;
//
//   SingleFormViewModel singleFormViewModel = Get.put(SingleFormViewModel());
//
//   @override
//   void initState() {
//     singleFormViewModel.singleFormViewModel();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Column(
//           children: [
//             SizedBox(height: 55.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 37.h,
//                   width: 37.w,
//                   child: CommonBackButton(
//                     onPressed: () {
//                       Get.offAll(() => const BottomBarScreen(),
//                           transition: Transition.zoom);
//                     },
//                   ),
//                 ),
//                 Text(
//                   "Form",
//                   style: FontTextStyle.k00000020W400,
//                 ),
//                 selected == 2
//                     ? GestureDetector(
//                   onTap: () {
//                     Get.to(
//                           () => const DeathCertificate(),
//                       transition: Transition.zoom,
//                     );
//                   },
//                   child: Container(
//                     height: 37.h,
//                     width: 37.w,
//                     decoration: BoxDecoration(
//                       color: PickColor.k00529B,
//                       borderRadius: BorderRadius.circular(6.r),
//                     ),
//                     child: SvgPicture.asset(
//                       "assets/icons/print_icon.svg",
//                       height: 18.h,
//                       width: 20.9.w,
//                       fit: BoxFit.scaleDown,
//                     ),
//                   ),
//                 )
//                     : SizedBox(width: 37.w, height: 37.h),
//               ],
//             ),
//             SizedBox(height: 24.5.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(
//                 formPage.length,
//                     (index) => Container(
//                   height: 4.h,
//                   width: 123.w,
//                   // color: index < selected + 1
//                   color: selected >= index
//                       ? PickColor.k00529B
//                       : const Color(0xffDBDBDB),
//                 ),
//               ),
//             ),
//             SizedBox(height: 27.5.h),
//             Expanded(
//               child: PageView.builder(
//                 itemCount: formPage.length,
//                 scrollDirection: Axis.horizontal,
//                 physics: const NeverScrollableScrollPhysics(),
//                 controller: Controller.controller,
//                 onPageChanged: (value) {
//                   setState(() {
//                     selected = value;
//                   });
//                 },
//                 itemBuilder: (context, index) {
//                   return GetBuilder<SingleFormViewModel>(
//                     builder: (controller) {
//                       if (controller.apiResponse.status == Status.COMPLETE) {
//                         return SingleChildScrollView(
//                           child: formPage[index],
//                         );
//                       } else if (controller.apiResponse.status ==
//                           Status.LOADING) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else if (controller.apiResponse.status ==
//                           Status.ERROR) {
//                         return const Center(child: Text("ERROR"));
//                       } else {
//                         return const Center(
//                             child: Text("SOMETHING WENT WRONG"));
//                       }
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
