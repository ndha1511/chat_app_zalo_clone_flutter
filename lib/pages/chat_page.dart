import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zalo_clone_flutter/components/appbar/my_appbar.dart';
import 'package:zalo_clone_flutter/pages/contact_page.dart';
import 'package:zalo_clone_flutter/pages/message_page.dart';
import 'package:zalo_clone_flutter/pages/profile_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    MessagePage(),
    ContactPage(),
    ProfilePage()
  ];

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Tin nhắn"
    ),
    BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: "Danh bạ"
    ),
    BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: "Cá nhân"
    ),
   
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isSelected(int index) {
    return _selectedIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const MyAppbar(title: "Chat"),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: items.map((item) {
          int index = items.indexOf(item);
          return BottomNavigationBarItem(
            icon: item.icon,
            label: _isSelected(index) ? item.label : '',
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}