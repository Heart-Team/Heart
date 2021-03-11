import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    final Firestore database = Firestore.instance;
    QuerySnapshot snapshot = await database.collection(collection).getDocuments();
    return snapshot.documents;
  }
  
  Future queryData(String queryString) async {
    return Firestore.instance.collection('Organizations')
        .where('charityName', isGreaterThanOrEqualTo: queryString)
        .getDocuments();
  }
}