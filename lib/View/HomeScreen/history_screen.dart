import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uisapp/Api/Model/Response/get_all_form_response_model.dart';

import 'package:uisapp/Constant/common_color.dart';
import 'package:uisapp/Api/api_response.dart' as st;

import 'package:uisapp/View/HomeScreen/form.dart';

import '../../Constant/common_text_style.dart';
import '../../Constant/height_width.dart';
import '../../Controller/getx_contoller.dart';
import '../../ViewModel/get_all_form_view_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

GetControllerDemo getController1 = Get.put(GetControllerDemo());

class _HistoryScreenState extends State<HistoryScreen> {
  final box = GetStorage();
  GetAllFormsViewModel getAllFormsViewModel = Get.put(GetAllFormsViewModel());

  @override
  void initState() {
    getAllFormsViewModel.getAllFormsViewModel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wightColor,
      body: SingleChildScrollView(
        child: GetBuilder<GetAllFormsViewModel>(
          builder: (controller) {
            if (controller.apiResponse.status == st.Status.COMPLETE) {
              GetAllFormsResponseModel1 responseModel =
                  controller.apiResponse.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  responseModel.data.length,
                  (index) => Center(
                    child: Container(
                      height: height * 0.070,
                      width: width * 0.88,
                      margin: EdgeInsets.symmetric(vertical: height * 0.009),
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
                          SizedBox(width: width * 0.03),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                responseModel.data[index].deceasedName,
                                style: kBlackSW500,
                              ),
                              Text(
                                'Date of Death : 26-03-2021',
                                style: TextStyle(
                                  color: AppColor.greyColor,
                                  fontSize: height * 0.017,
                                  fontFamily: 'poly',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.03),
                            child: InkResponse(
                              onTap: () {
                                Get.to(
                                  FormUi(
                                    id: box.write(
                                        'formID',
                                        responseModel.data[index].id
                                            .toString()),
                                  ),
                                );
                              },
                              child: Container(
                                height: height * 0.044,
                                width: width * 0.26,
                                decoration: BoxDecoration(
                                  color: AppColor.blueColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Details',
                                    style: TextStyle(
                                        color: AppColor.wightColor,
                                        fontSize: height * 0.014),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if (controller.apiResponse.status == st.Status.LOADING) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.apiResponse.status == st.Status.ERROR) {
              return const Center(child: Text('ERROR'));
            } else {
              return const Center(child: Text('SOMETHING WENT WRONG'));
            }
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:universal_identification_system/Api/status.dart';
// import 'package:universal_identification_system/Constants/color.dart';
// import 'package:universal_identification_system/Constants/test_style.dart';
// import 'package:universal_identification_system/Model/Response/all_forms_response_model.dart';
// import 'package:universal_identification_system/View/HomeScreen/form.dart';
// import 'package:universal_identification_system/ViewModel/all_forms_view_model.dart';
//
// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }
//
// class _HistoryScreenState extends State<HistoryScreen> {
//   final box = GetStorage();
//
//   AllFormsViewModel allFormsViewModel = Get.put(AllFormsViewModel());
//
//   @override
//   void initState() {
//     allFormsViewModel.allFormsViewModel();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: GetBuilder<AllFormsViewModel>(
//         builder: (controller) {
//           if (controller.apiResponse.status == Status.COMPLETE) {
//             AllFormsResponseModel responseModel = controller.apiResponse.data;
//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Column(
//                 children: [
//                   SizedBox(height: 20.h),
//                   Column(
//                     children: List.generate(
//                       responseModel.data.length,
//                           (index) => Container(
//                         height: 60.h,
//                         width: 388.w,
//                         margin: EdgeInsets.only(bottom: 6.h),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(6.r),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 7,
//                               blurRadius: 7,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 12.w),
//                           child: Row(
//                             children: [
//                               Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     responseModel.data[index].deceasedName,
//                                     style: FontTextStyle.k31313116W400,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "Date of Death: ",
//                                         style: FontTextStyle.k84848416W400,
//                                       ),
//                                       Text(
//                                         '${responseModel.data[index].dateOfDeath}',
//                                         style: FontTextStyle.k35353512W400,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               const Spacer(),
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.to(
//                                         () => FormScreen(
//                                       id: box.write(
//                                           "formID",
//                                           responseModel.data[index].id
//                                               .toString()),
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   height: 30.h,
//                                   width: 98.w,
//                                   decoration: BoxDecoration(
//                                     color: PickColor.k00529B,
//                                     borderRadius: BorderRadius.circular(6.r),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "View Details",
//                                       style: FontTextStyle.kWhite14W400,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else if (controller.apiResponse.status == Status.ERROR) {
//             return const Center(child: Text("ERROR"));
//           } else if (controller.apiResponse.status == Status.LOADING) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return const Center(child: Text("SOMETHING WENT WRONG"));
//           }
//         },
//       ),
//     );
//   }
// }
