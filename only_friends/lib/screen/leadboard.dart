import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/widget/bottom_naviagtion_bar.dart';
import 'package:only_friends/widget/challengeList.dart';


import '../model/userModel.dart';


class LeadBoard extends StatefulWidget {
  LeadBoard({super.key});


  @override
  State<LeadBoard> createState() => _LeadBoardState();
}

class _LeadBoardState extends State<LeadBoard> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text("Classifica Generale Lead",
                style: GoogleFonts.pacifico(fontSize: 26, color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Container(width: 320,
                height: 400,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.amber)),
                child: ClassificaUtentiWidget())
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
                child: ClassificaUtentiWidget()),
          ),
        ],
      ),
    ]);
  }
}
