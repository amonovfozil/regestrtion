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
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  var enabled = true;

  var ishasData = true;
  void _textFieldListener() {
    setState(() {
      ishasData = _textController1.text.isEmpty;
      ishasData = _textController2.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _textController1,
          style: AppStyles.variablestyle(16, FontWeight.w700, primaryColor),
          onChanged: (value) => _textFieldListener(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            hintText: 'Пароль',
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
              borderSide: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
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
                onPressed: () => setState(() {
                      enabled = !enabled;
                    }),
                icon: SvgPicture.asset(
                  AppIcons.eye,
                  color: enabled ? Colors.black : null,
                )),
          ),
          obscureText: enabled,
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
          controller: _textController2,
          style: AppStyles.variablestyle(16, FontWeight.w700, primaryColor),
          onChanged: (value) => _textFieldListener(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            hintText: 'Повторите пароль',
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
              borderSide: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
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
          obscureText: true,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Iltimos iltimos parol qayta kiriting";
            } else if (value != _textController1.text) {
              return "noto'g'ri parol  ko`rtingiz";
            }
            return null;
          },
        ),
      ],
    );
  }
}
