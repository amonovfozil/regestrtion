// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registration_ui/constatns/app_colors.dart';
import 'package:registration_ui/constatns/app_icons.dart';
import 'package:registration_ui/constatns/text_styles.dart';

class CheckPasswordField extends StatefulWidget {
  final Map<String, dynamic> data;
  final String kiy;

  const CheckPasswordField({
    required this.data,
    required this.kiy,
    super.key,
  });

  @override
  State<CheckPasswordField> createState() => _CheckPasswordFieldState();
}

class _CheckPasswordFieldState extends State<CheckPasswordField> {
  final _textController = TextEditingController();

  var ishasData = true;
  void _textFieldListener() {
    setState(() {
      ishasData = _textController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _textController,
          onChanged: (value) => _textFieldListener(),
          decoration: InputDecoration(
            hintText: 'Пароль',
            hintStyle: AppStyles.variablestyle(17, FontWeight.w400, hintColor),
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SvgPicture.asset(
                AppIcons.password,
                alignment: Alignment.center,
                color: ishasData ? Colors.red : Colors.grey,
              ),
            ),
            suffixIcon: IconButton(
                onPressed: null, icon: SvgPicture.asset(AppIcons.eye)),
          ),
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "iltimos parol kiriting";
            }
            return null;
          },
          onSaved: (newValue) => widget.data[widget.kiy] = newValue!,
        ),
        const SizedBox(height: 15),
        TextFormField(
          style: AppStyles.variablestyle(16, FontWeight.w700, primaryColor),
          onChanged: (value) => _textFieldListener(),
          decoration: InputDecoration(
            hintText: 'Повторите пароль',
            hintStyle: AppStyles.variablestyle(17, FontWeight.w400, hintColor),
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SvgPicture.asset(
                AppIcons.password,
                alignment: Alignment.center,
                color: ishasData ? Colors.red : Colors.grey,
              ),
            ),
          ),
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Iltimos iltimos parol qayta kiriting";
            } else if (value != _textController.text) {
              return "noto'g'ri parol  ko`rtingiz";
            }
            return null;
          },
        ),
      ],
    );
  }
}
