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

  final String _userId;
  String _fullName;
  String _email;
  List<Map<String, dynamic>> _creditCards;
  bool _surveyTaken = false;
  String _imageUrl;
  bool _loggedIn = false;
  List<String> _relevantMacros = [];
  List<Map<String, String>> _relevantMicros = [];
  Map<String, dynamic> _surveyResults = {};
  // Map<String, dynamic>

  User(this._userId);

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

  List<String> get relevantMacros {
    return _relevantMacros;
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

  int get totalMicrosSelected {
    int count = 0;
    _surveyResults.values.forEach((element) {
      count += element.length;
    });
    return count;
  }

  void addMacro(String macro) {
    _relevantMacros.add(macro);
    print(_relevantMacros);
    notifyListeners();
  }

  void removeMacro(String macro) {
    _relevantMacros.remove(macro);
    print(_relevantMacros);
    notifyListeners();
  }

  Future<void> getMicroCategories() async {
    final firestore = Firestore.instance;
    final res = await firestore
        .collection('Categories')
        .where("categoryName", whereIn: _relevantMacros)
        .getDocuments();

    _relevantMicros.clear();
    res.documents.forEach((element) {
      // _surveyResults[element.data['categoryName']].clear();
      element.data['microCategories'].forEach((item) {
        // _surveyResults[element.data['categoryName']].add(item['causeName']);
        _relevantMicros.add({
          'category': element.data['categoryName'],
          'causeName': item['causeName']
        });
      });
    });
    // print(_relevantMicros);
  }

  void updateSurveyResults() async {
    final firestore = Firestore.instance;
    _surveyResults.removeWhere((key, value) => value.length == 0);
    print(_userId);
    // try {
    //   await firestore.collection('Users').document('N3eKe4vrXqPqkkxWL174q1SbVZR2').updateData({
    //     'surveyTaken': true,
    //     'surveyResults': _surveyResults
    //   });
    // } catch (e) {
    // }
  }

  void addMicro(String macro, String micro) {
    // _surveyResults.containsKey(macro) ?
    //   _surveyResults['$macro'].add(micro)
    //   : 
    //   _surveyResults.add
    _surveyResults.update(macro, (value) {
      return [...value, micro];
    }, 
    ifAbsent: () => [micro]);
    notifyListeners();
    print(_surveyResults);
    print(_surveyResults.values);
  }

  void removeMicro(String macro, String micro){
    _surveyResults.update(
      macro, 
      (value){
        if(value.remove(micro))
          return [...value];
        return [...value];
      }
    );
    notifyListeners();
    print(_surveyResults);
    print(_surveyResults.values);
  }
}
