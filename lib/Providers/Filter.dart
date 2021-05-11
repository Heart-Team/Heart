import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Filter with ChangeNotifier {

  List<Map<String, dynamic>> _searchResults = [];
  bool _isFiltering = false;

  bool get isFiltering {
    return _isFiltering;
  }

  List<Map<String, dynamic>> get searchResults {
    return [..._searchResults];
  }

  Future<void> search(String query) async {
    if(query.isEmpty){
      clearResults();
      notifyListeners();
    }
    else {
      final firestore = Firestore.instance;
      final modifiedQuery = capitalizeWords(query);
      clearResults();
      try {
        firestore.collection('Organizations')
          .where('charityName', isGreaterThanOrEqualTo: modifiedQuery)  
          .where('charityName', isLessThan: modifiedQuery + '\uf8ff')
          .getDocuments()
          .then((res){
            res.documents.forEach((element) {
              _searchResults.add(element.data);
            });
            notifyListeners();
          }
        );
      } catch (e) {
        print(e.message);
      }
    }
  }

  String capitalizeWords(String word) {
    var split = word.toLowerCase().split(' ');
    return split.map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  void clearResults() {
    _searchResults.clear();
  }  

  void setFiltering(){
    _isFiltering = true;
    notifyListeners();
  }

  void clearFiltering(){
    print('I am being called');
    _isFiltering = false;
    notifyListeners();
  }

  List<Map<String, dynamic>> filter(dynamic filters, List<dynamic> charities){
    final res = charities.where((element){
      return 
        (element['categoryName'].isNotEmpty && filters['categories'].contains(element['categoryName'])) &&
        (filters['location'] == '' || element['state'] == filters['location']) &&
        element['rating'] >= double.parse(filters['rating']); 
    });    
    return res.toList(); 
  }

  void filterSearch(dynamic filters, List<dynamic> charities){
    _searchResults = filter(filters, charities);
    notifyListeners();
  }
}
