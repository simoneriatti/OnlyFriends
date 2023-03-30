import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String id;
  String description;
  String photoUrl;
  String title;

  PostModel({
    required this.id,
    required this.description,
    required this.photoUrl,
    required this.title,
  });

  factory PostModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PostModel(
      id: data['id'],
      description: data['description'],
      photoUrl: data['photoUrl'],
      title: data['title'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'description': description,
      'photoUrl': photoUrl,
      'title': title,
    };
  }
}
