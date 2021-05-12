import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Charity.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_share/flutter_share.dart';

class SavedCharityTile extends StatelessWidget {

  final String charityId;
  final String dateAdded;
  final String name;
  final String category;

  SavedCharityTile(this.charityId, this.name, this.category, this.dateAdded);

  Future<void> share() async {
    String charityUrl;
    await Firestore.instance.collection('Organizations').document(charityId)
        .collection('Details').document('description')
        .get().then((value) {
       charityUrl = value['website'];
    });
    await FlutterShare.share(
        title: 'Share charity with others!',
        text: 'Check out this charity I found on Heart! ${name}',
        linkUrl: charityUrl,
    );
    print('shared charityUrl: ${charityUrl}');
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 10
          )
        ]
      ),
      child: Row(
        children: [
          Expanded(
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateAdded,
                  style: TextStyle(
                    color: AppTheme().primaryColor
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.share), 
                color: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: (){
                  share();
                }
              ),
              IconButton(
                icon: Icon(Icons.delete), 
                onPressed: (){
                  user.removeFavorite(charityId, name, category, dateAdded);
                },
                color: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}