import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/screen/authpages/auth_page.dart';
import 'package:only_friends/screen/home_page.dart';
import 'package:only_friends/screen/leadboard.dart';
import 'package:only_friends/screen/new_post.dart';
import 'package:only_friends/screen/user_profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _pages = [HomePage(), const LeadBoard(), NewPost(), const UserProfile()];

  checkUserSignInNow() async {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      // dato che quando ti registri su firebase si logga automaticamente,
      // con questo hack controlliamo se la data di creazione per capire se
      // arriviamo qui da una registrazione o da un login
      if (user != null &&
          user.metadata.creationTime!
              .add(const Duration(seconds: 20))
              .isAfter(DateTime.now())) {
        // se arriviamo da una registrazione, torniamo alla authpage passando come parametro true,
        // per riattivare la pagina di login e non quella della registrazione
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const AuthPage(
                      showLoginPage: true,
                    )));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkUserSignInNow();
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, "auth");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: signUserOut, icon: const Icon(Icons.exit_to_app))
              ],
              centerTitle: true,
              // elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "OnlyFriends",
                  style:
                      GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            body: _pages[_selectedIndex],
            bottomNavigationBar: NavigationBar(
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.abc),
                    label: "Home",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.abc),
                    label: "Classifica",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.abc),
                    label: "+",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.abc),
                    label: "Profilo",
                  ),
                ],
                selectedIndex: _selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                })));
  }
}
