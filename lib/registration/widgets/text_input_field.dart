// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registration_ui/constatns/app_colors.dart';
import 'package:registration_ui/constatns/text_styles.dart';

class TextInputField extends StatefulWidget {
  final Map<String, dynamic> data;
  final String kiy;
  final String icon;
  final String hint;
  final Widget? action;
  final TextInputType keyboardtype;
  const TextInputField({
    required this.data,
    required this.kiy,
    required this.icon,
    required this.hint,
    required this.keyboardtype,
    this.action,
    super.key,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final _textController = TextEditingController();

  var ishasData = true;
  void _textFieldListener() {
    setState(() {
      ishasData = _textController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.variablestyle(16, FontWeight.w700, primaryColor),
      controller: _textController,
      onChanged: (value) => _textFieldListener(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        hintText: widget.hint,
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
          child: SvgPicture.asset(
            widget.icon,
            alignment: Alignment.center,
            color: ishasData ? Colors.red : Colors.grey,
          ),
        ),
        suffixIcon: widget.action,
      ),
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyboardtype,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Maydonni to'ldiring!";
        }
        return null;
      },
      onSaved: (newValue) => widget.data[widget.kiy] = newValue!,
    );
  }
}
