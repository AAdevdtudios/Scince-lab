import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'authController2.dart';

final Future<FirebaseApp> initialization = Firebase.initializeApp();
CollectionReference firebaseFirestore =
    FirebaseFirestore.instance.collection("users");
FirebaseAuth auth = FirebaseAuth.instance;
AuthController2 controller2 = AuthController2.instance;
