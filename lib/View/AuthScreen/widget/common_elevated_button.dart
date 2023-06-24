import 'package:flutter/material.dart';
import 'package:uisapp/Constant/common_color.dart';

import '../../../Constant/common_text_style.dart';
import '../../../Constant/height_width.dart';

///ElevatedButton

ElevatedButton commonElevatedButton(Function() onTap, String title) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.blueColor,
      minimumSize: Size(
        width * 0.85,
        height * 0.065,
      ),
    ),
    child: Text(
      title,
      style: kSignInW500,
    ),
  );
}

///  OutlinedButton

OutlinedButton commonOutlinedButton(Function() onTap, String title) {
  return OutlinedButton(
    onPressed: onTap,
    style: TextButton.styleFrom(
      side: const BorderSide(color: Colors.indigo, width: 1),
      minimumSize: Size(
        width * 0.30,
        height * 0.065,
      ),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: AppColor.blueColor,
        fontSize: height * 0.024,
        fontFamily: 'poly',
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

/// ElevatedButton

ElevatedButton commonElevatedButton2(Function() onTap, String title) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      elevation: 4,
      backgroundColor: AppColor.wightColor,
    ),
    child: Text(
      title,
      style: kBRegisterW500,
    ),
  );
}
