import 'package:flutter/material.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';

class CustomTextPassword extends StatelessWidget {
  final IconData? iconData;
  final Function? function;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final String text;

  const CustomTextPassword(
      {Key? key,
      this.iconData,
      this.function,
      this.validator,
      this.controller,
      required this.obscureText,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        controller: controller!,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: AppColor.goldColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(strokeAlign: 0, color: AppColor.secondary),
          ),
          prefixIcon: Icon(
            Icons.drive_file_rename_outline,
            color: AppColor.secondary,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              iconData,
              color: AppColor.secondary,
            ),
            onPressed: () {
              function!();
            },
          ),
        ),
        style: TextStyle(color: Colors.black),
        obscureText: obscureText,
        validator: validator,
        cursorColor: AppColor.goldColor,
        undoController: UndoHistoryController(),

        //    autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
