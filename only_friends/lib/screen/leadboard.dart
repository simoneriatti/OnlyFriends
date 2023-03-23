import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadBoard extends StatelessWidget {
  const LeadBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "OnlyFriends",
          style: GoogleFonts.pacifico(fontSize: 40, color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
