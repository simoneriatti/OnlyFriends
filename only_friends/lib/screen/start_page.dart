import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/screen/authpages/auth_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const AuthPage()));
    });
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Text("OnlyFriends",
            style: GoogleFonts.poppins(fontSize: 60, color: Colors.white)),
      ),
    );
  }
}
