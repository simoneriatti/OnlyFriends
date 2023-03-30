import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/userModel.dart';
import 'package:firebase_core/firebase_core.dart';
import '../model/provaScoreModel.dart';

class ClassificaUtentiWidget extends StatefulWidget {
  const ClassificaUtentiWidget({super.key});

  @override
  State<ClassificaUtentiWidget> createState() => _ClassificaUtentiWidgetState();
}

class _ClassificaUtentiWidgetState extends State<ClassificaUtentiWidget> {
  Future<List<UtenteModel>?>? users;
  int i = 0;
  String medaglia = '';

  Future<UtenteModel> getUserDetails(String name) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Utente')
        .where("nome", isEqualTo: name)
        .get();
    final userName =
        snapshot.docs.map((e) => UtenteModel.fromSnapshot(e)).single;
    return userName;
  }

  Future<List<UtenteModel>> getAllUser() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Utente').get();
    final userList =
        snapshot.docs.map((e) => UtenteModel.fromSnapshot(e)).toList();
    return userList;
  }

  Future<List<ScoreModel>> getUserOrder() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('ScoreChallenges')
        .where("idChallenge", isEqualTo: 1)
        .orderBy("score", descending: true)
        .get();
    final userList =
        snapshot.docs.map((e) => ScoreModel.fromSnapshot(e)).toList();
    return userList;
  }

  @override
  void initState() {
    users = getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: getUserOrder(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                i = 0;
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, inde) {
                      if(i == 0){
                        medaglia = "🥇";
                      }
                      if(i ==1){
                        medaglia = "🥈";
                      }
                      if(i == 2){
                        medaglia = "🥉";
                      }
                      if (i > 2){
                        medaglia= "💀";
                      }
                      i++;
                   return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("$medaglia"),
                ),
                title: Text(snapshot.data![inde].nome),
                subtitle: Text('Score: ${snapshot.data![inde].score}'),
              ),
            );
                    });
              }
              if (snapshot.hasError) {
                return Text('Errore: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Caricamento...');
              }
              if (snapshot.hasData) final users = snapshot.data!.toString();
              return Text("$users");
              
            },
          ),
        ),
      ],
    );
  }
}

// class ClassificaUtentiWidget extends StatelessWidget {
//   final String nomeSfida;
//   ClassificaUtentiWidget({required this.nomeSfida});
  
//   final users = FirebaseFirestore.instance.collection("challenges").
//     doc("LcirW5W9k95vn46hBecB").
//     collection("Globale");


//   void getChallengUser() async {
//     final ref = users.withConverter(
//       fromFirestore: Utente.fromFirestore,
//       toFirestore: (Utente utente, _) => utente.toFirestore(),
//     );
//     final docSnap = await ref.get();
//     final user = docSnap.docs.data(); // Convert to City object
//   }

//   @override
//     Widget build(BuildContext context) {
//       //convertitore di object generico ad Utente
//       final ref = users.withConverter(
//       fromFirestore: Utente.fromFirestore,
//       toFirestore: (Utente utente, _) => utente.toFirestore(),
//     );
//     final docSnap = await ref.get();
    
//     return FutureBuilder<QuerySnapshot>(
//       future: AsyncSnapshot.waiting(ref.get()),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Si è verificato un errore: ${snapshot.error}');
//         }

//         if (!snapshot.hasData) {
//           return Text('Nessun dato trovato');
//         }

//         return ListView.builder(
//           itemCount: ref.length,
//           itemBuilder: (context, index) {
//             final user = ref[index];

//             return ListTile(
//               title: Text('${user.name} ${user.lastname}'),
//               subtitle: Text('Punteggio: ${user.point}'),
//             );
//           },
//         );
//       },
//     );
//   }
// }




  // Widget build(BuildContext context) {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: firestore.collection("challenges").
  //   doc("LcirW5W9k95vn46hBecB").
  //   collection(nomeSfida).orderBy('point', descending: true).snapshots(),
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Si è verificato un errore: ${snapshot.error}');
  //       }

  //       if (!snapshot.hasData) {
  //         return Text('Nessun dato trovato');
  //       }

  //       List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

  //       return ListView.builder(
  //         itemCount: documents.length,
  //         itemBuilder: (context, index) {
  //           final userData = documents[index].data();
  //           final nome = userData!.name;
  //           final cognome = userData!['lastname'];
  //           final punteggio = userData!['point'];

  //           return ListTile(
  //             title: Text('$nome $cognome'),
  //             subtitle: Text('Punteggio: $punteggio'),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }


      //   if (snapshot.hasData) {
      //     final utenti = snapshot.data!;
      //     return Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           'Classifica ${widget.nomeSfida}:',
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(height: 10),
      //         ListView.builder(
      //           shrinkWrap: true,
      //           physics: NeverScrollableScrollPhysics(),
      //           itemCount: utenti.length,
      //           itemBuilder: (context, index) {
      //             final utente = utenti[index];
      //             return Text(
      //               '${index + 1}. ${utente.name} ${utente.lastname} (${utente.point})',
      //               style: TextStyle(fontSize: 16),
      //             );
      //           },
      //         ),
      //       ],
      //     );
      //   } else if (snapshot.hasError) {
      //     return Center(child: Text('Errore durante il recupero della classifica'));
      //   } else {
      //     return Center(child: CircularProgressIndicator());
      //   }
      // }

  