import 'package:heart_app/Services/DataController.dart';

class Organization {
  String charityName;
  String categoryName;
  int assetAmount;
  String imageURL;

  Organization(
      this.charityName, this.categoryName, this.assetAmount, this.imageURL);

  void passObjects (stringQuery) {
    DataController dataController = DataController();
   dataController.queryData(stringQuery).then((value) {
     // value is of querysnapshot type
      // we need to pass each index of value to the object Organization

   });
  }



}