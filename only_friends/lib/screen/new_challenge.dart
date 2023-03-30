import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/screen/home_page.dart';
import 'package:only_friends/screen/main_page.dart';
import 'package:only_friends/widget/bottom_naviagtion_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math';

class NewChallenge extends StatefulWidget {
  const NewChallenge({super.key});
  @override
  _NewChallengeState createState() => _NewChallengeState();
}

class _NewChallengeState extends State<NewChallenge> {
  String _challengeTitle = "";
  String _challengeDescription = "";
  int _randomId = getRandomInt(100000);
  

  static int getRandomInt(int max) {
  Random random = Random();
  return random.nextInt(max);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // widget per sostituire i due TextFormField uguali che creerò più avanti. Per un codice più pulito.
  Widget _buildTextField(String hintText, Function(String) onChanged) {
    return TextFormField(
      maxLines: hintText == 'Enter description' ? 4 : 1,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "OnlyFriends",
                  style:
                      GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
                ),
              ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Title',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 10),
              _buildTextField("Aggiungi un titolo", (value) {
                setState(() {
                  _challengeTitle = value;
                });
              }),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 10),
              _buildTextField("Aggiungi una descrizione", (value) {
                setState(() {
                  _challengeDescription = value;
                });
              }),
              SizedBox(height: 20),
              SizedBox(height: 10),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Create'),
                onPressed: () async {
                  // Oggetto Map per mappare l'oggetto postData, ovvero i campi del post
                  Map<String, dynamic> challengeData = {
                    'id': _randomId,
                    'title': _challengeTitle,
                    'description': _challengeDescription,
                  };

                  // Inserimento del postData all'interno di Firestone
                  await firestore.collection('challenges').add(challengeData);

                  // Piccolo messaggio su console per far vedere che il post è stato inserito correttamente
                  print('Challenge added successfully');

                  // Ritorno alla pagina principale
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}