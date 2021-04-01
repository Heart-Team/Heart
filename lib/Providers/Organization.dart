import 'package:heart_app/Services/DataController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/widgets/home/OrganizationTile.dart';

class Organization with ChangeNotifier{
  String _charityName;
  String _categoryName;
  String _assetAmount;
  String _imageURL;
  String _ein;

  Organization(
      this._charityName, this._categoryName, this._assetAmount, this._imageURL);

  String get charityName {
    return _charityName;
  }

  String get categoryName {
    return _categoryName;
  }

  String get assetAmount {
    return _assetAmount;
  }

  String get imageURL {
    return _imageURL;
  }

  String get ein {
    return _ein;
  }

  //a function to query data from firestore
  Future queryDataFrom(String queryString) async {
    return Firestore.instance.collection('Organizations')
        .where('charityName', isGreaterThanOrEqualTo: queryString)
        .getDocuments();
  }

  void updateOrgTile(String queryString) async {
    QuerySnapshot snapshotData;
    queryDataFrom(queryString).then((value) {
      snapshotData = value;
      //notifyListeners();
    });

    // an example to get the information from the snapshotData above
    // String name = snapshotData.documents[0].data['charityName'];
    // or using the ListView.builder with index
    // data.documents[index].data['categoryName']
    // need to set a notifier that connects the home screen
  }
}



