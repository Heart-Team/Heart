import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/saved_charities/ButtonRow.dart';
import 'package:heart_app/widgets/saved_charities/SavedCharityTile.dart';
import 'package:provider/provider.dart';

class SavedCharitiesScreen extends StatelessWidget {

  static const routeName = '/saved-charities';

  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context);
    final user = Provider.of<User>(context,listen: false);

    final savedCharities = user.favorites;


    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            height: deviceHeight.size.height * 0.3,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/saved_charities_screen/header.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ),
                Positioned(
                  top: deviceHeight.padding.top + 10,
                  left: 10,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_backspace,
                      size: 32,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ),
                Center(
                  child: Text(
                    //TODO:
                    // BUG FIX: needs to pass the folder name from saved charities tile or profile1
                    //          then we need to only show single tile with categoryName matching the folder name
                    'My Charities',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 28,
                      fontWeight: FontWeight.w600
                    ),
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          ButtonRow(),
          SizedBox(height: 30,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) => SavedCharityTile(
                savedCharities[index]['charityId'],
                savedCharities[index]['charityName'],
                savedCharities[index]['categoryName'],
                savedCharities[index]['dateAdded'],
              ),
              itemCount: savedCharities.length
            )
          )
        ],
      ),
    );
  }
}