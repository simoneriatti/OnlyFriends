import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String idUtente;
  String tag;
  String descrizione;
  String refImg;
  String timestamp;

  PostModel({
    required this.idUtente,
    required this.tag,
    required this.descrizione,
    required this.refImg,
    required this.timestamp,
  });

  factory PostModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PostModel(
      idUtente: data['idUtente'],
      tag: data['tag'],
      descrizione: data['descrizione'],
      refImg: data['refImg'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'idUtente': idUtente,
      'tag': tag,
      'descrizione': descrizione,
      'refImg': refImg,
      'timestamp': timestamp,
    };
  }
}
