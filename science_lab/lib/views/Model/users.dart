import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String photo;
  int tickets;

  UserModel({this.id, this.name, this.email, this.photo, this.tickets});

  UserModel.fromDocumentSnapshot(DocumentSnapshot docs) {
    id = docs["id"];
    name = docs["name"];
    email = docs["email"];
    photo = docs["photo"];
    tickets = docs["tickets"];
  }
}
