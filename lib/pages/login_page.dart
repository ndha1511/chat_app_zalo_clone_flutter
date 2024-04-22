import 'package:flutter/material.dart';
import 'package:zalo_clone_flutter/components/appbar/my_appbar.dart';
import 'package:zalo_clone_flutter/forms/login_form.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(title: "Đăng nhập"),
      body: LoginForm()
    );
  }
}