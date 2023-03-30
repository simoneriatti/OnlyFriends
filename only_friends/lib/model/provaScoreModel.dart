
import 'package:cloud_firestore/cloud_firestore.dart';

class ScoreModel {
  int idChallenge;
  String nome;
  int score;

  ScoreModel({
    required this.idChallenge,
    required this.nome,
    required this.score,
  });

  factory ScoreModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ScoreModel(
      idChallenge: data['idChallenge'],
      nome: data['nome'],
      score: data['score'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'idChallenge': idChallenge,
      'nome': nome,
      'score': score,
    };
  }
}
