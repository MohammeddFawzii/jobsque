import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String getUserId() {
  User? user = FirebaseAuth.instance.currentUser;
  String userId = user?.uid ?? "OgsHEVAXxTglszrJh5yfogthqK82";
  return userId;
}

Future<String> getUserName() async {
  Completer<String> completer = Completer<String>();

  FirebaseFirestore.instance
      .collection('users')
      .doc(getUserId())
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        String? userName = data['userName'];
        completer.complete(userName ?? "Unknown");
      } else {
        completer.complete("Unknown");
      }
    } else {
      completer.complete("Unknown");
    }
  });

  return completer.future;
}
