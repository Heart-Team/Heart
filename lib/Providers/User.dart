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

  final String userId;
  String _fullName;
  String _email;
  String _imageUrl = '';
  List<Map<String, dynamic>> _creditCards;
  List<Map<String, dynamic>> _favorites;

  // bool _loggedIn = false;
  // List<String> _relevantMacros = [];
  // List<Map<String, String>> _relevantMicros = [];
  // Map<String, dynamic> _surveyResults = {};
  // Map<String, dynamic>

  User(this.userId);

  String get user {
    return userId;
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

  List<Map<String, dynamic>> get creditCards {
    return _creditCards;
  }

  List<Map<String, dynamic>> get favorites {
    return _favorites;
  }

  Future<void> getUserInfo() async {
    final firestore = Firestore.instance;
    try {
      final res = await firestore.collection('Users').document(userId).get();
      print(res.data);
      _fullName = res.data['fullName'];
      _imageUrl = res.data['imageUrl'];
      print(_fullName);
      print(_imageUrl);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  // below should be a function to store an organization to favorites
  void addFavorite(String charityID){
    Firestore.instance.collection('Users')
        .document(userId)
        .updateData({'favorites': FieldValue.arrayUnion([charityID])});
  }

  void removeFavorite(String charityID){
    Firestore.instance.collection('Users')
        .document(userId)
        .updateData({'favorites': FieldValue.arrayRemove([charityID])});
  }

  Future<void> getFavorites() async{
    final firestore = Firestore.instance;
    DocumentReference ref = await firestore.collection('Users').document(userId);
    await ref.get().then((snapshot) {
      _favorites = snapshot.data['favorites'];
    });
    // to test out if it does return the favorites array in terminal
    print(_favorites);
    // return
    return _favorites;
  }

  // now we have populated the favorites array
  // we can use the array elements to populate
}
