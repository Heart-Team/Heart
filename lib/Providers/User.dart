import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:heart_app/screens/SurveyScreen1.dart';
import 'package:heart_app/screens/TabsScreen.dart';

class User with ChangeNotifier {
  // userID
  // name/username
  // email
  // credit cards
  // image

  String _userId;
  String _fullName;
  String _email;
  List<Map<String, dynamic>> _creditCards;
  Map<String, dynamic> _surveyResults = {};
  bool _surveyTaken = false;
  String _imageUrl;
  bool _loggedIn = false;
  List<Map<String, String>> _relevantMicros = [];
  // Map<String, dynamic>

  String get userId {
    return _userId;
  }

  String get fullName {
    return _fullName;
  }

  String get email {
    return _email;
  }

  String get imageUrl {
    return _imageUrl;
  }

  bool get surveyTaken {
    return _surveyTaken;
  }

  bool get isLoggedIn {
    return _loggedIn;
  }

  List<Map<String, dynamic>> get creditCards {
    return _creditCards;
  }

  List<Map<String, String>> get relevantMicros {
    return _relevantMicros;
  }

  Map<String, dynamic> get surveyResults {
    return _surveyResults;
  }

  void addMacro(String macro) {
    _surveyResults['$macro'] = [];
    print(_surveyResults);
    notifyListeners();
  }

  void removeMacro(String macro) {
    _surveyResults.remove(macro);
    print(_surveyResults);
    notifyListeners();
  }

  Future<void> getMicroCategories() async {
    final firestore = Firestore.instance;
    final res = await firestore
        .collection('Categories')
        .where("categoryName", whereIn: _surveyResults.keys.toList())
        .getDocuments();

    _relevantMicros.clear();
    res.documents.forEach((element) {
      _surveyResults[element.data['categoryName']].clear();
      element.data['microCategories'].forEach((item) {
        _surveyResults[element.data['categoryName']].add(item['causeName']);
        _relevantMicros.add({
          'category': element.data['categoryName'],
          'causeName': item['causeName']
        });
      });
    });
    print(_relevantMicros);
  }
}
