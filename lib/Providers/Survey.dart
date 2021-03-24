import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:heart_app/screens/SurveyScreen1.dart';
import 'package:heart_app/screens/TabsScreen.dart';

class Survey with ChangeNotifier {
  final String _userId;
  bool _surveyTaken = false;
  List<String> _relevantMacros = [];
  List<Map<String, String>> _relevantMicros = [];
  Map<String, dynamic> _surveyResults = {};
  List<Map<String, dynamic>> _recommendations = [];

  Survey(this._userId);

  String get userId {
    return _userId;
  }

  bool get surveyTaken {
    return _surveyTaken;
  }

  List<String> get relevantMacros {
    return _relevantMacros;
  }

  List<Map<String, String>> get relevantMicros {
    return _relevantMicros;
  }

  Map<String, dynamic> get surveyResults {
    return _surveyResults;
  }

  List<Map<String, dynamic>> get recommendations {
    return _recommendations;
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
      element.data['microCategories'].forEach((item) {
        _relevantMicros.add({
          'category': element.data['categoryName'],
          'causeName': item['causeName']
        });
      });
    });
  }

  void updateSurveyResults() async {
    final firestore = Firestore.instance;
    _surveyResults.removeWhere((key, value) => value.length == 0);
    print(_surveyResults);
    // try {
    //   await firestore.collection('Users').document('N3eKe4vrXqPqkkxWL174q1SbVZR2').updateData({
    //     'surveyTaken': true,
    //     'surveyResults': _surveyResults
    //   });
    // } catch (e) {
    // }
  }

  Future<void> homeRecommendations() async {
    print('here');
    final firestore = Firestore.instance;
    try {
      final res = await firestore.collection('Users').document(_userId).get();
      print('🚀🚀🚀');
      res.data['surveyResults'].forEach((key, value) {
        value.forEach((causeName) async {
          final res = await firestore
              .collection('Organizations')
              .where('causeName', isEqualTo: causeName)
              .where('rating', isEqualTo: 4)
              .where('assetAmount', isGreaterThanOrEqualTo: 5369831)
              .limit(3)
              .getDocuments();
          res.documents.forEach((element) {
            _recommendations.add(element.data);
          });
        });
      });
      /*
        loop thoruhg the micros from the db
        
      .where(causeNmae= , Rating>= 3 , assetAmount>= avgAmount).limit(3)
      */
      // { amount: 41369831.23775871, rating: 3.465926299848561 }
    } catch (e) {
      print(e);
    }
  }

  void addMicro(String macro, String micro) {
    _surveyResults.update(macro, (value) {
      return [...value, micro];
    }, ifAbsent: () => [micro]);
    notifyListeners();
  }

  void removeMicro(String macro, String micro) {
    _surveyResults.update(macro, (value) {
      if (value.remove(micro)) return [...value];
      return [...value];
    });
    notifyListeners();
  }
}
