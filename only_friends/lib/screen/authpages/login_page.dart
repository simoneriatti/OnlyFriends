import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:only_friends/widget/dialog_create_group.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignInPage;
  const LoginPage({Key? key, required this.showSignInPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passGroupController = TextEditingController();
  bool passToggle = true;
  bool passGroupToggle = true;

  void logUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Email'),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Password'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45.0, bottom: 30),
            child: Text(
              'Welcome Again',
              style: GoogleFonts.pacifico(
                  fontSize: 50,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 40.0, right: 40.0, bottom: 10.0, left: 40.0),
            child: Form(
              key: _formfield,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.mail),
                      ),
                      style: GoogleFonts.poppins(fontSize: 20),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        style: GoogleFonts.poppins(fontSize: 20),
                        obscureText: passToggle,
                        controller: passController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "* Required";
                          } else if (value.length < 6) {
                            return "at least 6 characters long";
                          } else {
                            return null;
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Password del gruppo',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  passGroupToggle = !passGroupToggle;
                                });
                              },
                              child: Icon(passGroupToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        obscureText: passGroupToggle,
                        controller: passGroupController,
                        style: GoogleFonts.poppins(fontSize: 20),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "* Required";
                          } else {
                            return null;
                          }
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Vuoi creare un nuovo Gruppo?",
                              style: GoogleFonts.poppins(fontSize: 16)),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => StatefulBuilder(
                                  builder:
                                      (BuildContext dialogcontext, setState) =>
                                          const DialogCreateGroup(),
                                ),
                              );
                            },
                            child: Text(
                              "Crea Gruppo",
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                        width: 250.0,
                        height: 50.0,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.orange),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22.0)))),
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            if (_formfield.currentState!.validate()) {
                              logUserIn();
                              emailController.clear();
                              passController.clear();
                              passGroupController.clear();
                            }
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member? ", style: GoogleFonts.poppins()),
              GestureDetector(
                onTap: widget.showSignInPage,
                child: Text("Sign in",
                    style: GoogleFonts.poppins(
                        fontSize: 22, color: Colors.orange)),
              )
            ],
          ),
        ],
      ),
    ]);
  }
}
