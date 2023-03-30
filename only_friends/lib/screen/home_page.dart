import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/widget/bottom_naviagtion_bar.dart';
import 'package:only_friends/widget/post_card.dart';
import '../model/postModel.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  final user = FirebaseAuth.instance.currentUser!;
  final users = ["Gian", "Vuk"];

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    setState(() {
      users.addAll(["Elena"]);
    });
  }

    Future<List<PostModel>> getAllPost() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Utente').get();
    final postList =
        snapshot.docs.map((e) => PostModel.fromSnapshot(e)).toList();
    return postList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      itemCount: users.length + 1,
      itemBuilder: (context, index) {
        if (index < users.length) {
          final user = users[index];

          return PostCard(user: user);
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
