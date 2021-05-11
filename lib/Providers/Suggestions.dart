import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Suggestions extends ChangeNotifier {

  final List<dynamic> favorites;
  final String userId;
  List<Map<String, dynamic>> _suggestions = [];
  List<String> _micros = [];

  Suggestions(this.favorites, this.userId);

  List<Map<String, dynamic>> get suggestions {
    return [..._suggestions];
  }

  int random(int max) => Random().nextInt(max);

  Future<void> userSuggestions() async {
    final firestore = Firestore.instance;
    if(_micros.isEmpty){
      final res = await firestore.collection('Users').document(userId).get();
      res.data['surveyResults'].forEach((key, value){
        _micros = [..._micros, ...value];
      });
    }
    try {
      for(int i = 3; i >= 0; i--){
        int index = random(i + 1);
        final res = await firestore.collection('Organizations')
          .where('assetAmount', isLessThanOrEqualTo: 5369831)
          .where('causeName', isEqualTo: _micros[index])
          .limit(3)
          .getDocuments();
        res.documents.forEach((element) {
          _suggestions.add(element.data);
        }); 
      } 
      // notifyListeners();
    } catch (e) {
      print(e);
    }
  }

}