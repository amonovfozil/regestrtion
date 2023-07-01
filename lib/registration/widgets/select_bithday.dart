import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:registration_ui/constatns/app_colors.dart';
import 'package:registration_ui/constatns/app_icons.dart';
import 'package:registration_ui/constatns/text_styles.dart';

class SelectBirthday extends StatefulWidget {
  const SelectBirthday({super.key});

  @override
  State<SelectBirthday> createState() => _SelectBirthdayState();
}

class _SelectBirthdayState extends State<SelectBirthday> {
  DateTime? selectDate;

  void showcalendar(BuildContext ctx) {
// flutter material style
    showDatePicker(
      currentDate: DateTime.now(),
      context: ctx,
      initialDate: DateTime(2022),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectDate = date;
        });
      }
    });
// cupertino style
    // showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //           title: Center(child: Text('Select Date')),
    //           contentPadding: EdgeInsets.symmetric(horizontal: 30),
    //           content: Container(
    //             height: 250,
    //             width: 300,
    //             child: CupertinoDatePicker(
    //               mode: CupertinoDatePickerMode.date,
    //               onDateTimeChanged: (value) {},

    //             ),
    //           ),
    //         ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              AppIcons.birthday,
            ),
          ),
          Text(
            selectDate == null
                ? 'Дата рождения'
                : DateFormat('dd.MM.yyy').format(selectDate!),
            style: selectDate == null
                ? AppStyles.variablestyle(17, FontWeight.w400, hintColor)
                : AppStyles.variablestyle(16, FontWeight.w700, primaryColor),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => showcalendar(context),
            icon: SvgPicture.asset(
              AppIcons.calendar,
            ),
          ),
        ],
      ),
    );
  }
}
