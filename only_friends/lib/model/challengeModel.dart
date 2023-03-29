import 'package:cloud_firestore/cloud_firestore.dart';

class ChallengeModel {
  String idChallenge;
  String nomeChallenge;

  ChallengeModel({
    required this.idChallenge,
    required this.nomeChallenge,
  });

  factory ChallengeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ChallengeModel(
      idChallenge: data['idChallenge'],
      nomeChallenge: data['nomeChallenge'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'idChallenge': idChallenge,
      'nomeChallenge': nomeChallenge,
    };
  }
}
