import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  // dùng property này để thay đổi icon back button mặc định nếu cần thiết
  final bool showBackButton;
  const MyAppbar({
    super.key,
    required this.title,
    this.showBackButton = false
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: showBackButton ? IconButton(
        icon: const Icon(Icons.arrow_back_ios), 
        onPressed: () => Navigator.of(context).pop(),) : null,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.primary
        ])),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
