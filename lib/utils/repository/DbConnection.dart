// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class DbConnection {
  FirebaseFirestore db = FirebaseFirestore.instance;

  getFirestoreInstance() {
    return db;
  }
}
