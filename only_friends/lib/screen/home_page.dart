import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/widget/bottom_naviagtion_bar.dart';
import 'package:only_friends/widget/post_card.dart';
import '../model/postModel.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

    Future<List<PostModel>> getAllPost() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Utente').get();
    final postList =
        snapshot.docs.map((e) => PostModel.fromSnapshot(e)).toList();
    return postList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
        child: Column(
          children: [
            PostCard(user: user.email!),
            PostCard(user: user.email!),
            PostCard(user: user.email!),
            PostCard(user: user.email!),
            PostCard(user: user.email!),
            PostCard(user: user.email!),
          ],
        ),
      ),
    ]);
  }
}
