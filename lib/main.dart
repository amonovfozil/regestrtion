import 'package:flutter/material.dart';
import 'package:registration_ui/registration/registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8F9CB1)),
        useMaterial3: true,
      ),
      home: const RegistrationPage(),
    );
  }
}
