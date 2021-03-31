import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Charity with ChangeNotifier {
  Map<dynamic, dynamic> _charityDetails = {};

  Map<dynamic, dynamic> get charityDetails {
    return _charityDetails;
  }

  Future<void> getCharityInfo(String charityId) async {
    try {
      _charityDetails.clear();
      final firestore = Firestore.instance;
      final generalInfo =
          await firestore.collection('Organizations').document(charityId).get();
      final description = await firestore
          .collection('Organizations')
          .document(charityId)
          .collection('Details')
          .document('description')
          .get();

      _charityDetails.addAll(generalInfo.data);
      _charityDetails.addAll(description.data);

      
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
