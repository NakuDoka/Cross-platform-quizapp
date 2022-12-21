import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFunctions {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getQuizes() async {
    Future<QuerySnapshot<Map<String, dynamic>>> quizes = firestore.collection('quiz').get();
    return await quizes;
  }
}
