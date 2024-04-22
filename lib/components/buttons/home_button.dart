import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  const HomeButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: color == null ? 
            LinearGradient(colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary
            ]) : null,
          borderRadius: BorderRadius.circular(30.0),
          color: color
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
