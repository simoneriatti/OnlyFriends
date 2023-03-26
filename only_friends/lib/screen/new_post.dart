import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/screen/home_page.dart';
import 'package:only_friends/screen/main_page.dart';
import 'package:only_friends/widget/bottom_naviagtion_bar.dart';
import 'package:firebase_core/firebase_core.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  String _postTitle = "";
  String _postDescription = "";
  String _photoUrl = "";
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _postTitle = value;
                  });
                },
              ),
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
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter description',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _postDescription = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    // Add image functionality
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Add an image',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Create'),
                onPressed: () async {
                  // Oggetto Map per mappare l'oggetto postData, ovvero i campi del post
                  Map<String, dynamic> postData = {
                    'title': _postTitle,
                    'description': _postDescription,
                    'photoUrl': _photoUrl,
                  };

                  // Inserimento del postData all'interno di Firestone
                  await firestore.collection('posts').add(postData);

                  // Piccolo messaggio su console per far vedere che il post è stato inserito correttamente
                  print('Post added successfully');

                  // Navigate to the home screen
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