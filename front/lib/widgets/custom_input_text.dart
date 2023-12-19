import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomInputText extends StatelessWidget {
  final String? label;
  final IconData? iconData;
  final bool obscureText;
  final Function? function;
  final Function? onsaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? error;
  final TextInputType? specifykeyboard;

  const CustomInputText(
      {super.key,
      this.specifykeyboard,
      this.label,
      this.iconData,
      required this.obscureText,
      this.controller,
      this.function,
      this.onsaved,
      this.validator,
      this.error});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Expanded(
        child: TextFormField(
          cursorColor: AppColor.secondary,
          controller: controller,
          keyboardType: specifykeyboard,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            label: Text(
              '$label',
              style: TextStyle(color: Colors.black54, fontSize: Checkbox.width),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                strokeAlign: 0,
                color: AppColor.goldColor,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                iconData,
                color: AppColor.goldColor,
              ),
              onPressed: () {
                function!();
              },
            ),
          ),
          style: TextStyle(color: Colors.black),
          obscureText: obscureText,
          onSaved: (newValue) {
            onsaved!();
          },
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}
