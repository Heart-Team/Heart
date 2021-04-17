
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MonthlyPayments with ChangeNotifier {
  String _userId;
  Map<dynamic, dynamic> _monthlyPayments;

  // MonthlyPayments(this._userId,this._monthlyPayments);

  String get userId {
    return _userId;
  }

  Map<dynamic, dynamic> get monthlyPayments {
    return _monthlyPayments;
  }

  void storePayments(String userId, Map<dynamic, dynamic> payments) {
    Firestore.instance.collection('MonthlyPayments')
        .document(userId)
        .setData({'payments:':payments},merge: true);
  }

  Future<Map<dynamic,dynamic>> getPayments(String userId) async{
      final firestore = Firestore.instance;
      var data;
      DocumentReference ref = await firestore.collection('MonthlyPayments').document(userId);
      await ref.get().then((snapshot) {
        data = snapshot.data['payments'];
      });
      // to test out if it does return the favorites array in terminal
      print(data);

      // return
      return data;
  }

}