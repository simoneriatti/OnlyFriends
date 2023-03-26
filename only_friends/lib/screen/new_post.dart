import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/widget/bottom_naviagtion_bar.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  String _postTitle = "";
  String _postDescription = "";
  String _photoUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Title"),
            onChanged: (value) {
              setState(() {
                _postTitle = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Description'),
            onChanged: (value) {
              setState(() {
                _postDescription = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Photo URL'),
            onChanged: (value) {
              setState(() {
                _photoUrl = value;
              });
            },
          ),
          ElevatedButton(
            child: Text('Create'),
            onPressed: () {
              // Save the post data to your database or use it to create a new post.
              print('Post Title: $_postTitle');
              print('Post Description: $_postDescription');
              print('Photo URL: $_photoUrl');
            },
          ),
        ],
      ),
    );
  }

}