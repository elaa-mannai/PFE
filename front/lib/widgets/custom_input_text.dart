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

  const CustomInputText(
      {super.key,
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
      padding:  EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Expanded(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(
              '$label',
              style: TextStyle(color: Colors.black54, fontSize: Checkbox.width),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColor.goldColor,
            )),
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
