import 'package:flutter/material.dart';

class Cart with ChangeNotifier { 

  List<Map<String, dynamic>> _cartCharities = [];

  List<Map<String, dynamic>> get cartCharities {
    return _cartCharities;
  }

  void addCharity(String ein, String title, double amount, String imageUrl){
    print({
      'ein': ein,
      'title': title,
      'amount': amount,
      'imageUrl': imageUrl
    });
  }

}