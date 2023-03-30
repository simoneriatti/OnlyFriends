import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:only_friends/screen/home_page.dart';
import 'package:only_friends/screen/leadboard.dart';
import 'package:only_friends/screen/new_post.dart';
import 'package:only_friends/screen/user_profile.dart';
import 'package:only_friends/widget/dialog_popup_create.dart';
import 'package:only_friends/widget/header_drawer.dart';

import '../screen/authpages/auth_page.dart';

class BottomBar extends StatefulWidget {

    const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
    int _selectedIndex = 0;
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

    final List<NavigationDestination> destinations = [
        NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
        ),
        NavigationDestination(
            icon: Icon(Icons.leaderboard),
            label: "Classifica",
        ),
        NavigationDestination(
            icon: Icon(Icons.add),
            label: "Sfida / Post ",
        ),
        NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profilo",
        )
        
    ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomePage(),LeadBoard(),Popup(),UserProfile()];
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: signUserOut,
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "OnlyFriends",
                style: GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          drawer: HeaderDrawer(),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              items: destinations.map((destination) {
                  return BottomNavigationBarItem(
                      icon: destination.icon,
                      label: destination.label,
                  );
              }).toList(),
              onTap: (int index) {
                  setState(() {
                      _selectedIndex = index;
                  });
              },
          ),
          body: pages.elementAt(_selectedIndex)
      ),
    );
  }
}

class NavigationDestination {
    final Icon icon;
    final String label;

    NavigationDestination({
        required this.icon,
        required this.label,
    });
}
