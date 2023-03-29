import 'package:flutter/material.dart';
import 'package:only_friends/screen/home_page.dart';
import 'package:only_friends/screen/leadboard.dart';
import 'package:only_friends/screen/new_post.dart';
import 'package:only_friends/screen/user_profile.dart';

class BottomBar extends StatefulWidget {

    const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
    int _selectedIndex = 0;

    final List<NavigationDestination> destinations = [
        NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
        ),
        NavigationDestination(
            icon: Icon(Icons.leaderboard),
            label: "Leaderboard",
        ),
        NavigationDestination(
            icon: Icon(Icons.add),
            label: "New Post",
        ),
        NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profile",
        )
        
    ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomePage(),LeadBoard(),NewPost(),UserProfile()];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            items: destinations.map((destination) {
                return BottomNavigationBarItem(
                    icon: destination.icon,
                    label: destination.label,
                );
            }).toList(),
            onTap: (int index) {
                setState(() {
                    _selectedIndex = index;
                });
            },
        ),
        body: pages.elementAt(_selectedIndex)
    );
  }
}

class NavigationDestination {
    final Icon icon;
    final String label;

    NavigationDestination({
        required this.icon,
        required this.label,
    });
}
