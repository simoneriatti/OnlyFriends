import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:social_app_ui/util/data.dart';

class UserProfile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          margin: EdgeInsets.all(0.5),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 30,
              ),
              const SizedBox(height: 10),
              const Text(
                'Nome Utente ', // mettere variabile da collegare al db
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  backgroundColor: Color(0x00000000),
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "@nomeUtente",
                style: TextStyle(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                  TextButton(
                    child:
                        Text("segui", style: TextStyle(color: Colors.black45)),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    child: const Text("condividi",
                        style: TextStyle(color: Colors.black45)),
                    onPressed: () {},
                    // color: Theme.of(context).accentColor,
                    //  onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildPost("Posts"),
                    _buildPosition("position"),
                    _buildPoints("point"),
                  ],
                ),
              ),
              //  Container(height: 30, margin: EdgeInsets.all(10),),
              Row(
                children: const <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 0, 0),
                      child: Text(
                        "Descrizione",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                height: 100,
                color: const Color.fromARGB(51, 163, 163, 163),
              ),
              Row(
                children: const <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(32, 20, 0, 0),
                      child: Text(
                        "Post",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ))
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1))), // child: Image.network(
                      //   'https://www.example.com/image.jpg',
                      //   height: 200,
                      // ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'titolo post', //ATTENZIONE !! SE NO METTERE TUTTO CON UN IMMAGINO DI SFONDO SE C'è L'IMMAGINE ALTRIMENTI SOLO LA SCRITTA
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                'Testo della descrizione',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 40),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.volume_up),
                      tooltip: 'grazie gian<3',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.volume_up),
                      tooltip: 'siamo le bimbe di gian',
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),

              //               Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     Expanded(
              //       child: Center(
              //         child:
              //       ),
              //     ),
              //     Expanded(
              //       child: Center(
              //         child: Text(
              //           'Testo colonna 2',
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              // const SizedBox(height: 30),
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   primary: false,
              //   padding: const EdgeInsets.all(5),
              //   itemCount: 5,
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1,
              //   ),
              //   itemBuilder: (BuildContext context, int index) {
              //     return Padding(
              //         padding: const EdgeInsets.all(5.0),
              //         child: Container(
              //           color: Color.fromARGB(189, 0, 0, 0),
              //         )
              //         //Image.asset(
              //         //   "assets/images/cm0.jpeg",
              //         //   fit: BoxFit.cover,
              //         //   ),
              //         );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPost(String title) {
    var post =
        "3"; //collegare al db per avere i dati di follower posizione e post

    return Column(
      children: <Widget>[
        Text(
          post,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(),
        ),
      ],
    );
  }

  Widget _buildPosition(String title) {
    var position = "2"; //var da collegare al db

    return Column(
      children: <Widget>[
        Text(
          position,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(),
        ),
      ],
    );
  }

  Widget _buildPoints(String title) {
    var points = "1"; //var collegata al DB

    return Column(
      children: <Widget>[
        Text(
          points,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(),
        ),
      ],
    );
  }
}

// Padding(
//   padding: const EdgeInsets.symmetric(vertical: 25.0),
//   child: Text("Classifica Generale Profile",
//       style: GoogleFonts.pacifico(fontSize: 26, color: Colors.black)),
// ),
// Padding(
//   padding: const EdgeInsets.only(bottom: 25.0),
//   child: Container(
//       width: 320,
//       height: 250,
//       decoration:
//           BoxDecoration(border: Border.all(color: Colors.amber)),
//       child: Column()),
// ),
// Padding(
//   padding: const EdgeInsets.symmetric(vertical: 25.0),
//   child: Text("Classifica Mongolino D'Oro",
//       style: GoogleFonts.pacifico(fontSize: 26, color: Colors.black)),
// ),
// Padding(
//   padding: const EdgeInsets.only(bottom: 25.0),
//   child: Container(
//       width: 320,
//       height: 250,
//       decoration:
//           BoxDecoration(border: Border.all(color: Colors.amber)),
//       child: Column()),
// ),
//         ],
//       ),
//     ]);
//   }
// }
