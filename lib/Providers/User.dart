import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:encrypt/encrypt.dart' as Encrypt;

class User with ChangeNotifier {
  // userID
  // name/username
  // email
  // credit cards
  // image

  final String userId;
  String _fullName;
  String _email;
  String _location;
  String _imageUrl = '';
  List<dynamic> _cards = [];
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

  String get location {
    return _location;
  }

  List<Map<String, dynamic>> get cards {
    return _cards;
  }

  Future<void> getUserInfo() async {
    final firestore = Firestore.instance;
    try {
      final res = await firestore.collection('Users').document(userId).get();
      print(res.data);
      _fullName = res.data['fullName'];
      _imageUrl = res.data['imageUrl'];
      _location = res.data['location'];
      _cards = res.data['cards'];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<String> uploadImage(File image) async {
    // upload to stroage bucket
    final firebaseStorage = FirebaseStorage.instance;
    try {
      var snapshot = await firebaseStorage.ref()
                      .child('users/$userId')
                      .putFile(image).onComplete;
      final path = await snapshot.ref.getDownloadURL();
      return path;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<void> editInfo(String fullName, String location, String imageUrl) async {
    // update firestore with all the data changed by the page
    final firestore = Firestore.instance;
    if(fullName == null || fullName.isEmpty) fullName = _fullName;
    if(location == null || location.isEmpty) location = _location;
    if(imageUrl == null || imageUrl.isEmpty) imageUrl = _imageUrl;

    try {
      // store link in user document
      await firestore
        .collection('Users') 
        .document(userId)
        .setData({
          'fullName': fullName,
          'location': location,
          'imageUrl': imageUrl
        }, merge: true);

      _fullName = fullName;
      _location = location;
      _imageUrl = imageUrl;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<String> updatePassword(String newPassword) async {
    try {
      final user = await FirebaseAuth.instance.currentUser();
      await user.updatePassword(newPassword);
      return 'success';
    } catch (e) {
      print(e.message);
      return null;
    }
  }
  

  String encrypt(String cardNumber){
    final key = Encrypt.Key.fromSecureRandom(32);
    final iv = Encrypt.IV.fromSecureRandom(16);
    final encrypter = Encrypt.Encrypter(Encrypt.AES(key));
    final encrypted = encrypter.encrypt(cardNumber, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String encryptedString){
    final key = Encrypt.Key.fromSecureRandom(32);
    final iv = Encrypt.IV.fromSecureRandom(16);
    final encrypter = Encrypt.Encrypter(Encrypt.AES(key));
    return encrypter.decrypt64(encryptedString, iv:iv); // decrypt the string
  }

  String fetchCardType(String cardNumber){
    final num = cardNumber[0];
    switch(num){
      case "4":
        return "visa";
      case "5":
        return "mastercard";
      case "6":
        return "discover";  
    }
    return "";
  }

  Future<void> addCreditCard(String cardNumber, String date) async {
    final firestore = Firestore.instance;
    final cardInfo = {
      'cardNumber': encrypt(cardNumber),
      'expDate': date,
      'type': 'mastercard'
    };
    try {
      await firestore.collection('Users').document(userId).updateData({
        'cards': [
          ..._cards,
          cardInfo
        ]
      });
      _cards.add(cardInfo);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
