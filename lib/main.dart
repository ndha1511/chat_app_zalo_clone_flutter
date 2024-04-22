import 'package:flutter/material.dart';
import 'package:zalo_clone_flutter/pages/chat_page.dart';
import 'package:zalo_clone_flutter/pages/home_page.dart';
import 'package:zalo_clone_flutter/pages/login_page.dart';
import 'package:zalo_clone_flutter/pages/register_page.dart';
import 'package:zalo_clone_flutter/utils/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // init storage hive
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  // open box
  await Hive.openBox("storageBox");

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
        '/login': (context) => const LoginPage(),
        '/register':(context) => const RegisterPage(),
        '/chat':(context) => const ChatPage()
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme
    );
  }
}
