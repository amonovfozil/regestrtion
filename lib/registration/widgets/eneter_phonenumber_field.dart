// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registration_ui/constatns/app_colors.dart';
import 'package:registration_ui/constatns/app_icons.dart';
import 'package:registration_ui/constatns/text_styles.dart';

class EnteredPhonenumber extends StatefulWidget {
  final Map<String, dynamic> data;
  final String kiy;

  const EnteredPhonenumber({required this.data, required this.kiy, super.key});

  @override
  State<EnteredPhonenumber> createState() => _EnteredPhonenumberState();
}

class _EnteredPhonenumberState extends State<EnteredPhonenumber> {
  final _textController = TextEditingController();

  var ishasData = true;
  void _textFieldListener() {
    setState(() {
      ishasData = _textController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        style: AppStyles.variablestyle(16, FontWeight.w700, primaryColor),
        controller: _textController,
        onChanged: (value) => _textFieldListener(),
        decoration: InputDecoration(
          hintText: 'Телефон',
          hintStyle: AppStyles.variablestyle(17, FontWeight.w400, hintColor),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppIcons.phone,
                  alignment: Alignment.center,
                  color: ishasData ? Colors.red : Colors.grey,
                ),
                Text(
                  '+998',
                  style: AppStyles.variablestyle(
                      16, FontWeight.w700, primaryColor),
                ),
              ],
            ),
          ),
        ),
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Maydonni to'ldiring!";
          }
          return null;
        },
        onSaved: (newValue) => widget.data[widget.kiy] = newValue!,
      ),
    );
  }
}
