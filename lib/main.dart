import 'package:flutter/material.dart';
import 'package:student_app/Screens/auth_screens/login_screen.dart';

void main() {
  runApp(const SchoolManagementApp());
}

class SchoolManagementApp extends StatelessWidget {
  const SchoolManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management System',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200EE),
          brightness: Brightness.light,
        ),
        typography: Typography.material2021(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6200EE))),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

