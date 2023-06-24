import 'package:flutter/material.dart';

import '../../../Constant/height_width.dart';

class CommonTextFieldAuth extends StatefulWidget {
  const CommonTextFieldAuth({
    Key? key,
    this.commonController,
    required this.commonHintText,
    required this.commonKeyboardType,
    required this.commonOnPressed,
    this.sufixIcon,
  }) : super(key: key);
  final dynamic commonController;
  final String commonHintText;
  final TextInputType commonKeyboardType;
  final VoidCallback? commonOnPressed;
  final dynamic sufixIcon;
  @override
  State<CommonTextFieldAuth> createState() => _CommonTextFieldAuthState();
}

class _CommonTextFieldAuthState extends State<CommonTextFieldAuth> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {},
      keyboardType: widget.commonKeyboardType,
      controller: widget.commonController,
      decoration: InputDecoration(
        suffixIcon: widget.sufixIcon,
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: widget.commonHintText,
        hintStyle: TextStyle(
            color: Colors.grey, fontSize: height * 0.018, fontFamily: 'poly'),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
