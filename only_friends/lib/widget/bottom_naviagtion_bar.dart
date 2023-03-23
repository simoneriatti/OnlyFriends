import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
    const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [NavigationDestination(icon: Icon(Icons.abc),label: "Home",),
      NavigationDestination(icon: Icon(Icons.abc),label: "Classifica",)],
    );
  }
}