// ignore_for_file: deprecated_member_use, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registration_ui/constatns/app_colors.dart';
import 'package:registration_ui/constatns/app_icons.dart';
import 'package:registration_ui/constatns/text_styles.dart';
import 'package:registration_ui/registration/widgets/check_password_field.dart';
import 'package:registration_ui/registration/widgets/text_input_field.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    Map<String, dynamic> SignUpData = {
      'name': '',
      'email': '',
      'phonenumber': '',
      'birthday': '',
      'password': '',
    };
    void submitData() {
      if (_formkey.currentState!.validate()) {
        _formkey.currentState!.save();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: nativColor,
        elevation: 0,
        leading: IconButton(
          alignment: Alignment.centerLeft,
          onPressed: () {},
          icon: SvgPicture.asset(
            AppIcons.back,
            color: primaryColor,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Регистрация',
                  style: AppStyles.h1,
                ),
                const SizedBox(height: 30),
                TextInputField(
                  data: SignUpData,
                  kiy: 'name',
                  icon: AppIcons.user,
                  hint: 'имя',
                  keyboardtype: TextInputType.name,
                ),
                const SizedBox(height: 15),
                TextInputField(
                  data: SignUpData,
                  kiy: 'email',
                  icon: AppIcons.email,
                  hint: 'Почта',
                  keyboardtype: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                TextInputField(
                  data: SignUpData,
                  kiy: 'phonenumber',
                  icon: AppIcons.phone,
                  hint: 'Телефон',
                  keyboardtype: TextInputType.phone,
                ),
                const SizedBox(height: 15),
                TextInputField(
                  data: SignUpData,
                  kiy: 'birthday',
                  icon: AppIcons.birthday,
                  hint: 'Дата рождения',
                  keyboardtype: TextInputType.phone,
                  action: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      AppIcons.calendar,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                CheckPasswordField(
                  data: SignUpData,
                  kiy: 'password',
                ),
                const SizedBox(height: 132),
                InkWell(
                  onTap: () => submitData(),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: secondaryColor,
                    ),
                    child: Center(
                      child: Text(
                        'Зарегистрироваться',
                        style: AppStyles.variablestyle(
                          17,
                          FontWeight.w700,
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
