import 'package:flutter/material.dart';
import 'package:zalo_clone_flutter/components/buttons/home_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text(
            "Zalo", 
            style: TextStyle(
              color: Colors.blue[600],
              decoration: TextDecoration.none,
            ),
           
          ),
          const SizedBox(height: 500,),
          HomeButton(
            text: "ĐĂNG NHẬP", 
            onPressed: () => Navigator.pushNamed(context, "/login"),
            textColor: Colors.white,
          ),
          const SizedBox(height: 20,),
          HomeButton(
            text: "ĐĂNG KÝ", 
            onPressed: () => Navigator.pushNamed(context, "/register"),
            color: Colors.grey[350],
          )
        ],
      ),
    );
  }
}