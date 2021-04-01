import 'package:flutter/material.dart';

class Cart with ChangeNotifier {

  List<Map<String, dynamic>> _cartCharities = [];

  List<Map<String, dynamic>> get cartCharities {
    return _cartCharities;
  }

}