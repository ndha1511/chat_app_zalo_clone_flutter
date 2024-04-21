import 'package:flutter/material.dart';
import 'package:zalo_clone_flutter/pages/home_page.dart';
import 'package:zalo_clone_flutter/pages/login_page.dart';
import 'package:zalo_clone_flutter/pages/register_page.dart';
import 'package:zalo_clone_flutter/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/register':(context) => RegisterPage()
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme
    );
  }
}
