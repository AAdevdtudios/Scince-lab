import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:science_lab/views/Model/users.dart';

class Database {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> createUser(UserModel userModel) async {
    try {
      await firestore.collection("users").doc(userModel.id).set({
        "id": userModel.id,
        "name": userModel.name,
        "email": userModel.email,
        "photo": userModel.photo,
        "ticket": userModel.tickets
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot docs =
          await firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(docs);
    } catch (e) {
      rethrow;
    }
  }
}
