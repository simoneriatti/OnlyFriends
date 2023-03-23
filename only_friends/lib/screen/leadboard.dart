import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/widget/bottom_naviagtion_bar.dart';

class LeadBoard extends StatelessWidget {
  const LeadBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "OnlyFriends",
            style: GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        children: [Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text("Classifica Generale Lead", style: GoogleFonts.pacifico(fontSize: 26, color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Container(
                    width: 320,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber)
                    ),
                    child: Column(
                
                    )
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text("Classifica Mongolino D'Oro", style: GoogleFonts.pacifico(fontSize: 26, color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Container(
                    width: 320,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber)
                    ),
                    child: Column(
                    )
                  ),
                ),
              ],
        ),            

        ]
      )
    );
  }
}
