import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/widgets/custom_text.dart';

class CustomRadiobutton extends StatefulWidget {
  const CustomRadiobutton({super.key, this.controller, this.initialValue});
  final TextEditingController? controller;
    final Items? initialValue;


  @override
  State<CustomRadiobutton> createState() => _CustomRadiobuttonState();
}

enum Items { Customer, Vendor }

class _CustomRadiobuttonState extends State<CustomRadiobutton> {
  // Items? items = Items.Customer;
 late Items? items;
  @override
  void initState() {
    super.initState();
    // Set the default selection based on the initial value or controller value
    items = widget.initialValue ?? 
        (widget.controller != null
            ? (widget.controller!.text == 'Vendor' ? Items.Vendor : Items.Customer)
            : null);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: CustomText(
                text: 'Schedule an event',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.justify),
            leading: Radio<Items>(
              fillColor: MaterialStateColor.resolveWith(
                  (states) => AppColor.goldColor),
              value: Items.Customer,
              groupValue: items,
              onChanged: (Items? value) {
                setState(() {
                  items = value;
                  AccountInfoStorage.saveItems(items!.name.toString());
                });
                debugPrint(items!.name);
              },
            ),
            onTap: () {
              // get the enum and save on base de donne then go to service choises
            },
          ),
        ),
        Expanded(
          child: ListTile(
            title: CustomText(
                text: 'Sell Services',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.justify),
            leading: Radio<Items>(
              fillColor: MaterialStateColor.resolveWith(
                  (states) => AppColor.goldColor),
              value: Items.Vendor,
              groupValue: items,
              onChanged: (Items? value) {
                setState(() {
                  items = value;
                  AccountInfoStorage.saveItems(items!.name.toString());
                });
                debugPrint(items!.name);
              },
            ),
            onTap: () {
              // get the enum and save on base de donne then go to Vendor UIs
            },
          ),
        ),
      ],
    );
  }
}
