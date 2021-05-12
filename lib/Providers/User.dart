import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:encrypt/encrypt.dart' as Encrypt;

class User with ChangeNotifier {

  final String userId;
  String _fullName;
  String _email;
  String _location;
  String _imageUrl = '';
  List<dynamic> _cards = [];
  List<dynamic> _favorites = [];

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

  List<dynamic> get cards {
    return [..._cards];
  }

  List<dynamic> get favorites {
    return [..._favorites];
  }

  Future<void> getUserInfo() async {
    final firestore = Firestore.instance;
    try {
      final res = await firestore.collection('Users').document(userId).get();
      _fullName = res.data['fullName'];
      _imageUrl = res.data['imageUrl'];
      _location = res.data['location'];
      _cards = res.data['cards'];
      _favorites = res.data['favorites'];
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
    final key = Encrypt.Key.fromLength(32);
    final iv = Encrypt.IV.fromLength(16);
    final encrypter = Encrypt.Encrypter(Encrypt.AES(key));
    final encrypted = encrypter.encrypt(cardNumber, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String encryptedString){
    final key = Encrypt.Key.fromLength(32);
    final iv = Encrypt.IV.fromLength(16);
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

  Future<void> addCreditCard(
    String fullName,
    String cardNumber, 
    String date, 
    String streetAddress, 
    String apt, 
    String city, 
    String state, 
    String zipCode
  ) async {
    final firestore = Firestore.instance;
    final cardInfo = {
      'fullName': fullName,
      'cardNumber': encrypt(cardNumber),
      'expDate': date,
      'type': fetchCardType(cardNumber[0])
    };
    final billingInfo = {
      'streetAddress': streetAddress,
      'apt': apt,
      'city': city,
      'state': state,
      'zipCode': zipCode
    };
    try {
      await firestore.collection('Users').document(userId).updateData({
        'cards': [
          ..._cards,
          {
            'cardInfo': cardInfo,
            'billingInfo': billingInfo
          }
        ]
      });
      _cards.add({
        'cardInfo': cardInfo,
        'billingInfo': billingInfo
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCard(
    String fullName,
    String cardNumber,
    String expDate,
    String streetAddress,
    String apt,
    String city,
    String state,
    String zipCode,
    int index
  ) async {
    final firestore = Firestore.instance;
    try {
      _cards[index] = {
        'cardInfo': {
          'fullName': fullName,
          'cardNumber': encrypt(cardNumber),
          'expDate': expDate,
          'type': fetchCardType(cardNumber[0])
        },
        'billingInfo': {
          'streetAddress': streetAddress,
          'apt': apt,
          'city': city,
          'state': state,
          'zipCode': zipCode
        }
      };
      await firestore.collection('Users').document(userId).setData({
        'cards': _cards
      }, merge: true);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCard(int index) async {
    final firestore = Firestore.instance;
    try {
      _cards.removeAt(index);
      await firestore.collection('Users').document(userId).setData({
        'cards': _cards
      }, merge: true);
      notifyListeners();
    } catch (e) {
      print(e.message);
    }
  }
  
  // below should be a function to store an organization to favorites
  Future<void> addFavorite(String charityID, String charityName, String categoryName, String dateAdded) async {
    final toAdd = {'charityId':charityID, 'charityName': charityName, 'categoryName': categoryName, 'dateAdded':dateAdded};
    await Firestore.instance.collection('Users')
        .document(userId)
        .updateData({'favorites': FieldValue.arrayUnion([toAdd])});
    _favorites.add(toAdd);
    notifyListeners();
  }

  Future<void> removeFavorite(String charityID, String charityName, String categoryName, String dateAdded) async {
    final toRemove = {'charityId':charityID, 'charityName': charityName, 'categoryName': categoryName, 'dateAdded':dateAdded};

    //TODO:
    // BUG FIX: need to remove regardless of dateAdded
    await Firestore.instance.collection('Users')
        .document(userId)
        .updateData({'favorites': FieldValue.arrayRemove([toRemove])});

    for (var fav in favorites){
      if (fav['charityId']==charityID){
        _favorites.remove(fav);
      }
    }
    notifyListeners();
  }

  bool isInFavorite(String charityId){
    for (var fav in _favorites){
      if (fav['charityId'] == charityId){
        return true;
      }
    }
    return false;
  }

  List<dynamic> getDistinctFavoriteCategories() {
    var distinct = [];
    for (var fav in _favorites){
      if(!distinct.contains(fav['categoryName'])){
        distinct.add(fav['categoryName']);
      }
    }
    return distinct;
  }

  List<Map<dynamic, dynamic>> getSavedCharitiesInFolder(String folderName){
    List<Map<dynamic, dynamic>> charities = [];
    for (var fav in _favorites){
      if(fav['categoryName']==folderName){
        charities.add(fav);
      }
    }
    return charities;
  }
}
