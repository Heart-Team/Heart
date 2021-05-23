import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/widgets/finance_info/MonthlyPayment.dart';

class MonthlyPayments with ChangeNotifier {
  String _userId;
  List<dynamic> _monthlyPayments = [];

  MonthlyPayments(this._userId);

  String get userId {
    return _userId;
  }

  List<dynamic> get monthlyPayments {
    return _monthlyPayments;
  }

  Future<void> storePayments(Map<dynamic,dynamic> payment) async {
    await Firestore.instance.collection('MonthlyPayments')
        .document(userId)
        .setData({'payments': FieldValue.arrayUnion([payment])}, merge: true);
    _monthlyPayments.add(payment);
  }

  Future<void> getPayments() async{
    final firestore = Firestore.instance;
    try {
      _monthlyPayments.clear();
      final res = await firestore.collection('MonthlyPayments').document(userId).get();
      _monthlyPayments.addAll(res.data['payments']);
    } catch (e) {
      print(e);
    }
  }

}