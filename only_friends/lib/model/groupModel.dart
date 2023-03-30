import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  String nameGroup;
  String password;

  GroupModel({
    required this.nameGroup,
    required this.password,
  });

  factory GroupModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return GroupModel(
      nameGroup: data['nameGroup'],
      password: data['password'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nameGroup': nameGroup,
      'password': password,
    };
  }
}
