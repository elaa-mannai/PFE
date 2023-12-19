
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/home_view_customer.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button.dart';
import 'package:front/widgets/custom_chechbox.dart';
import 'package:front/widgets/custom_dropdown_list.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class ServiceChoices extends StatelessWidget {
  ServiceChoices({Key? key}) : super(key: key);
  final controller = Get.put<ProfileColntroller>(ProfileColntroller());
  final TextEditingController timeController = TextEditingController();
  DateTime? sDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white, //your color
        surfaceTintColor: AppColor.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.goldColor,
              size: 40,
            )),
        title: CustomText(
          fontSize: 16,
          text: 'Hello' /* custom name*/,
        ),
      ),
      body: SingleChildScrollView(
        child: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //calendar
              Column(
                children: [
                  CustomText(
                    textAlign: TextAlign.left,
                    text: 'Select date for the event',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    onDateChange: (value) {
                      if (value != null && value != sDate) {
                        sDate = value;
                        print("time ========================>$value");
                        controller.saveData('${sDate}');
                        print("time2 ========================>$sDate");
                      }
                      /*  print("time ========================>$sDate");
                      //   controller.selectDate(context);
                      timeController.text == '$value';
                      controller.saveData('${sDate}');
                     // controller.saveData(timeController.text);
                     // print("saved============>$sDate"); */
                    },
                    headerProps: EasyHeaderProps(
                      monthPickerType: MonthPickerType.switcher,
                      selectedDateFormat: SelectedDateFormat.fullDateDayAsStrMY,
                    ),
                    dayProps: EasyDayProps(
                      activeDayDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColor.goldColor,
                            Color(0xD0B336),
                            AppColor.goldColor,
                            /*  Color(0xff3371FF),
                            Color(0xff8426D6), */
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'selected date',
                    height: 25,
                    width: 150,
                    function: () {
                      // print("${controller.selectedDate.toLocal()}".split(' ')[0]);
                      //controller.selectDate(context);
                      controller.getData();
                      print('get time=========>${sDate}');
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 350,
                      height: 2,
                      color: AppColor.goldColor,
                    ),
                  ),
                ],
              ),

              //services selection
              Row(
                children: [
                  //
                  Expanded(
                    flex: 2,
                    child: CustomText(
                      textAlign: TextAlign.justify,
                      text: 'Services',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      //textAlign: TextAlign.left,
                    ),
                  ),

                  //select all
                  Row(
                    children: [
                      CustomButton(
                        text: 'Select all',
                        height: 25,
                        width: 150,
                        function: () {},
                      ),
                    ],
                  )
                ],
              ),
              // grid service buttons to select
              Expanded(
                flex: 1,
                child: GridView.count(
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  crossAxisCount: 3,
                  childAspectRatio: (1 / .4),
                  shrinkWrap: true,
                  children: List.generate(
                    6,
                    (index) {
                      return CustomChechbox(
                        height: 70,
                        width: 100,
                        widthBorder: 1,
                        colorBorder: AppColor.goldColor,
                        text: "Service",
                      );
                    },
                  ),
                ),
              ),

              //bugdte input text
              Expanded(
                flex: 1,
                child: CustomInputText(
                  label: 'Budget',
                  iconData: Icons.money,
                  obscureText: false,
                ),
              ),
              //location drop down
              Expanded(
                flex: 1,
                child: CustomDropdownList(),
              ),

              // Submit button
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      height: 40,
                      width: 120,
                      text: "Submit",
                      function: () {
                        Get.to(HomeView());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
