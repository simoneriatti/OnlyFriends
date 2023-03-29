import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:only_friends/screen/start_page.dart';
import 'firebase_options.dart';
import 'package:only_friends/screen/authpages/auth_page.dart';
import 'package:only_friends/screen/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: "OnlyFriends",
      debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Colors.white),
        home: const StartPage(),
        routes: <String, WidgetBuilder>{
          "auth": (BuildContext context) => const AuthPage(),
          "main": (BuildContext context) => const MainPage(),
        },
      ),
    );
  }
}
