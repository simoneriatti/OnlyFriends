import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/screen/authpages/login_page.dart';
import 'package:only_friends/screen/authpages/signin_page.dart';
import 'package:only_friends/screen/authpages/unknown_page.dart';

class AuthPage extends StatefulWidget {
  final bool? showLoginPage;
  const AuthPage({Key? key, this.showLoginPage}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleAuthPage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  void redirectToLogin() {
    if (widget.showLoginPage != null) {
      setState(() {
        showLoginPage = true;
      });
      FirebaseAuth.instance.signOut();
    }
  }

  @override
  void initState() {
    super.initState();
    redirectToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "OnlyFriends",
            style: GoogleFonts.pacifico(color: Colors.white, fontSize: 30),
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const UnknownPage(); // hack per navigare verso la main page
          } else {
            if (showLoginPage) {
              return LoginPage(showSignInPage: toggleAuthPage);
            } else {
              return SigninPage(showLoginPage: toggleAuthPage);
            }
          }
        },
      ),
    );
  }
}
