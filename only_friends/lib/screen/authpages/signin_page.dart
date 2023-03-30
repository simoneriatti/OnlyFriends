import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SigninPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formfield = GlobalKey<FormState>();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final passConfirmController = TextEditingController();
  bool passToggle = true;
  bool pass2Toggle = true;

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    emailController.dispose();
    userController.dispose();
    passController.dispose();
    passConfirmController.dispose();
    super.dispose();
  }

  Future signUserIn() async {
    if (passController.text.trim() == passConfirmController.text.trim()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim());
        addUserDetails(
          fNameController.text.trim(),
          lNameController.text.trim(),
          userController.text.trim(),
          emailController.text.trim(),
          passController.text.trim(),
        );
        Navigator.pop(context);
      } on FirebaseException catch (e) {
        // Navigator.pop(context);
        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return Center(
        //         child: Text(e.code),
        //       );
        //     });
        Navigator.pop(context);
        if (e.code == 'email-already-in-use') {
          userInUseMessage();
        } else if (e.code == 'wrong-password') {
          wrongPasswordMessage();
        }
      }
    } else {
      passController.clear();
      passConfirmController.clear();
      wrongPasswordMessage();
    }
  }

  Future addUserDetails(String firstName, String lastname, String username,
      String email, String password) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstName,
      'lastname': lastname,
      'username': username,
      'email': email,
      'password': password,
    });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Password do not match'),
          );
        });
  }

  void userInUseMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('User already in use'),
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
            padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
            child: Text(
              'Welcome',
              style: GoogleFonts.pacifico(
                  fontSize: 50,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40),
            child: Form(
              key: _formfield,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First name',
                        prefixIcon: Icon(Icons.person_outlined),
                      ),
                      style: const TextStyle(fontSize: 20),
                      controller: fNameController,
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last name',
                        prefixIcon: Icon(Icons.person_outlined),
                      ),
                      style: const TextStyle(fontSize: 20),
                      controller: lNameController,
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person_outlined),
                      ),
                      style: const TextStyle(fontSize: 20),
                      controller: userController,
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.mail_outline),
                      ),
                      style: const TextStyle(fontSize: 20),
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
                        style: const TextStyle(fontSize: 20),
                        obscureText: passToggle,
                        controller: passController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "* Required";
                          } else if (value.length <= 6) {
                            return "at least 6 characters long";
                          } else {
                            return null;
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 55.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Confirm password',
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                pass2Toggle = !pass2Toggle;
                              });
                            },
                            child: Icon(pass2Toggle
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      obscureText: pass2Toggle,
                      controller: passConfirmController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Required";
                        } else if (value.length <= 6) {
                          return "at least 6 characters long";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                      width: 250.0,
                      height: 50.0,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.orange),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(22.0)))),
                        child: const Text(
                          "SignUp",
                          style: TextStyle(fontSize: 22),
                        ),
                        onPressed: () {
                          if (_formfield.currentState!.validate()) {
                            signUserIn();
                          }
                        },
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member? "),
                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: const Text("Login",
                      style: TextStyle(fontSize: 22, color: Colors.purple)),
                )
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
