import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class ScoreChallengeModel {
  String idPost;
  String idChallenge;
  String idUtenteDestinatario;
  Int score;

  ScoreChallengeModel({
    required this.idPost,
    required this.idChallenge,
    required this.idUtenteDestinatario,
    required this.score,
  });

  factory ScoreChallengeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ScoreChallengeModel(
      idPost: data['idPost'],
      idChallenge: data['idChallenge'],
      idUtenteDestinatario: data['idUtenteDestinatario'],
      score: data['score'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'idPost': idPost,
      'idChallenge': idChallenge,
      'idUtenteDestinatario': idUtenteDestinatario,
      'score': score,
    };
  }

@override
  String toString() {
  return 
        '';
}
}
