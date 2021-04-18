
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/widgets/finance_info/MonthlyPayment.dart';

class MonthlyPayments with ChangeNotifier {
  String _userId;
  List<Map<dynamic,dynamic>> _monthlyPayments;

  // MonthlyPayments(this._userId,this._monthlyPayments);

  String get userId {
    return _userId;
  }

  List<Map<dynamic,dynamic>> get monthlyPayments {
    return _monthlyPayments;
  }

  void storePayments(String userId, Map<dynamic,dynamic> payment) {
    Firestore.instance.collection('MonthlyPayments')
        .document(userId)
        .updateData({'payments': FieldValue.arrayUnion([payment])});
  }

  Future<void> getPayments(String userId) async{
    final firestore = Firestore.instance;
    try {
      firestore.collection('MonthlyPayments').document(userId)
          .get().then((val){
            _monthlyPayments=val.data['payments'];
          });
        notifyListeners();
    } catch (e) {
      print(e.message);
    }
  }

}