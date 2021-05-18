import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier { 

  List<Map<String, String>> _cartCharities = [];
  double _totalSum = 0;
  final String userId;

  List<Map<String, String>> get cartCharities {
    return [..._cartCharities];
  }

  double get totalSum {
    _totalSum = 0;
    cartCharities.forEach((element) {
      _totalSum += double.parse(element['amount']);
    });

    return _totalSum;
  }

  Cart(this.userId);

  Future<void> getCharities() async {
    final firestore = Firestore.instance;
    try {
      firestore
        .collection('Cart')
        .document(userId)
        .get()
        .then((val){
          val.data.forEach((key, value) {
            _cartCharities.add({
              'ein': key,
              ...value
            });
          });
          notifyListeners();
        });
    } catch (e) {
      print(e.message);
    }
  }

  Future<String> addCharity(String ein, String title, String amount, String imageUrl) async {
    
    bool isInCart = _cartCharities.every((element) => element['ein'] != ein);
    final firestore = Firestore.instance;

    if(isInCart){
      Map<String, String> charity = {
        'title': title,
        'amount': amount,
        'imageUrl': imageUrl
      };
      
      try {
        await firestore.collection('Cart').document(userId).setData({
          ein: {
          ...charity
          }
        }, merge: true);

        _cartCharities.add({
          'ein': ein,
          ...charity
        });
        return 'Success';
      } catch (e) {
        return e.message;
      }
    }
    else{
      return 'This Charity Is Already In Your Cart';
    }
  }

  Future<void> removeItem(String ein) async {
    final firestore = Firestore.instance;
    try {
      await firestore.collection('Cart').document(userId).updateData({
        ein : FieldValue.delete()
      });
      _cartCharities.removeWhere((element) => element['ein'] == ein);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateItem(String ein, String newAmount) async {
    final index = _cartCharities.indexWhere((element) => element['ein'] == ein);
    final firestore = Firestore.instance;
    try{
      await firestore.collection('Cart').document(userId).setData({
        ein: {
          'amount': newAmount
        }
      }, merge: true);
      _cartCharities[index].update('amount', (value) => newAmount);
    }catch(e){
      print(e);
    }
  }

  Future<void> clearCart() async {
    final firesetore = Firestore.instance;
    try {
      await firesetore.collection('Cart').document(userId).delete();
      _cartCharities.clear();
    } catch (e) {
      print(e.message);
    }
  }
}