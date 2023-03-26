import 'package:flutter/material.dart';
import 'package:only_friends/screen/home_page.dart';
import 'package:only_friends/screen/leadboard.dart';
import 'package:only_friends/screen/new_post.dart';
import 'package:only_friends/screen/user_profile.dart';

class BottomBar extends StatefulWidget {

    BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
    int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomePage(),LeadBoard(),UserProfile(),NewPost()];
    return Scaffold(
        bottomNavigationBar: NavigationBar(
        destinations: [NavigationDestination(icon: Icon(Icons.abc),label: "Home",),
        NavigationDestination(icon: Icon(Icons.abc),label: "Classifica",),
        NavigationDestination(icon: Icon(Icons.abc),label: "Profilo",),
        NavigationDestination(icon: Icon(Icons.abc), label: "dedadadwa")],
        selectedIndex: 0,
        onDestinationSelected: (value) {setState(() {
          _selectedIndex = value;
        });
        }
      ),    
      body: pages.elementAt(_selectedIndex)
    );


  }
}