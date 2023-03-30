import 'package:cloud_firestore/cloud_firestore.dart';

class ChallengeModel {
  String idChallenge;
  String nomeChallenge;
  String descrizioneChallenge;

  ChallengeModel({
    required this.idChallenge,
    required this.nomeChallenge,
    required this.descrizioneChallenge,
  });

  factory ChallengeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ChallengeModel(
      idChallenge: data['idChallenge'],
      nomeChallenge: data['nomeChallenge'],
      descrizioneChallenge: data['descrizioneChallenge'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'idChallenge': idChallenge,
      'nomeChallenge': nomeChallenge,
      'descrizioneChallenge': descrizioneChallenge,
    };
  }
}
