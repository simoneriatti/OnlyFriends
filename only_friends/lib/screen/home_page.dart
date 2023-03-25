import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/widget/bottom_naviagtion_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text("Classifica Generale Home",
                style: GoogleFonts.pacifico(fontSize: 26, color: Colors.black)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Container(
                width: 320,
                height: 250,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.amber)),
                child: Column(
                  children: [Text(user.email!)],
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text("Classifica Mongolino D'Oro",
                style: GoogleFonts.pacifico(fontSize: 26, color: Colors.black)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Container(
                width: 320,
                height: 250,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.amber)),
                child: Column()),
          ),
        ],
      ),
    ]);
  }
}
