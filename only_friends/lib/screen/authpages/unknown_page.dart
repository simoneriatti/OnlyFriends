import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UnknownPage extends StatefulWidget {
  const UnknownPage({super.key});

  @override
  State<UnknownPage> createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  checkAuthentication() async {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "main");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
