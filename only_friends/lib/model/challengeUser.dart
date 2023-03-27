import 'package:cloud_firestore/cloud_firestore.dart';

class Utente {
  String name;
  String lastname;
  int point;


  Utente({
    required this.name,
    required this.lastname,
    required this.point,

  });

  factory Utente.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,) {
      final data = snapshot.data();
    return Utente(
      name: data?['name'],
      lastname: data?['lastname'],
      point: data?['puntepointggio'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'lastname': lastname,
      'point': point,
    };
  }
}
