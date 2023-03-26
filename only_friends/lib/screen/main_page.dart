import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/screen/home_page.dart';
import 'package:only_friends/screen/leadboard.dart';
import 'package:only_friends/screen/user_profile.dart';
import 'package:only_friends/widget/header_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var _pages = [const HomePage(), const LeadBoard(), const UserProfile()];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: Scaffold(
            bottomNavigationBar: NavigationBar(
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.abc),
                    label: "Home",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.abc),
                    label: "Classifica",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.abc),
                    label: "Profilo",
                  )
                ],
                selectedIndex: _selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                }),
            appBar: AppBar(
              centerTitle: true,
              // elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "OnlyFriends",
                  style:
                      GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            drawer: HeaderDrawer(),
            body: _pages[_selectedIndex]));
            
  }
}
