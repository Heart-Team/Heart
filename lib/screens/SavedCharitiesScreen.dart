import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/saved_charities/ButtonRow.dart';
import 'package:heart_app/widgets/saved_charities/SavedCharityTile.dart';

class SavedCharitiesScreen extends StatelessWidget {

  static const routeName = '/saved-charities';

  final savedCharities = [
    {
      'dateAdded': '12/10/2020',
      'name': 'Animal Charity 1',
      'location': 'New York, NY',
    },
    {
      'dateAdded': '12/20/2020',
      'name': 'Animal Charity 2',
      'location': 'New York, NY',
    },
    {
      'dateAdded': '12/30/2020',
      'name': 'Animal Charity 3',
      'location': 'New York, NY',
    },
    {
      'dateAdded': '12/40/2020',
      'name': 'Animal Charity 4',
      'location': 'New York, NY',
    }
  ];

  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context);

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
                    'My Animal\nCharities',
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
                savedCharities[index]['dateAdded'], 
                savedCharities[index]['name'], 
                savedCharities[index]['location'], 
              ),
              itemCount: savedCharities.length
            )
          )
        ],
      ),
    );
  }
}