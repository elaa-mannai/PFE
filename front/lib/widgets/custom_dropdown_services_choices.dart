import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';

class CustomDropdownServices extends StatefulWidget {
  const CustomDropdownServices({Key? key}) : super(key: key);

  @override
  State<CustomDropdownServices> createState() => _CustomDropdownServicesState();
}

class _CustomDropdownServicesState extends State<CustomDropdownServices> {
  final List<String> items = [
    "Catering", "Wedding dresses", "makeup",

    ///dinamic
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    ProductsController controller = ProductsController();

    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Expanded(
            child: Text(
              'Select categorie',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            AccountInfoStorage.saveCatgorieName(value);
            setState(() {
              selectedValue = value;
            });
            controller.getCategorieByName();
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 500,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColor.secondary,
            ),
            elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
            ),
            iconSize: 30,
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: MediaQuery.sizeOf(context).width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColor.secondary,
            ),
            offset: Offset(30, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}
