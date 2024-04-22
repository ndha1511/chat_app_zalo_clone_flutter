import 'package:flutter/material.dart';
import 'package:zalo_clone_flutter/components/appbar/my_appbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(title: "Đăng ký")
    );
  }
}