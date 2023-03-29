import 'package:cloud_firestore/cloud_firestore.dart';

class UtenteModel {
  String nome;
  String cognome;
  String username;
  String password;
  String email;


  UtenteModel({
    required this.nome,
    required this.cognome,
    required this.username,
    required this.password,
    required this.email,
  });

  factory UtenteModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document) {
      final data = document.data()!;
    return UtenteModel(
      nome: data["nome"] ,
      cognome: data['cognome'],
      username: data['username'],
      password: data['password'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toSnapshot() {
    return {
      'nome': nome,
      'cognome': cognome,
      'username': username,
      'password': password,
      'email': email,
    };
  }

@override
String toString() {
  return 
      '$nome,'
      '$cognome,'
      '$username,'
      '$password,'
      '$email';
}

}
