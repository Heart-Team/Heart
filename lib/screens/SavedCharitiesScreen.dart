import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/saved_charities/SavedCharityTile.dart';
import 'package:provider/provider.dart';

import '../theme.dart';


class SavedCharitiesScreen extends StatefulWidget {

  static const routeName = '/saved-charities';

  String folderName;

  SavedCharitiesScreen({this.folderName});


  @override
  _SavedCharitiesState createState() => _SavedCharitiesState();
}

class _SavedCharitiesState extends State<SavedCharitiesScreen>{
  var allSelected = true;

  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context);
    final user = Provider.of<User>(context,listen: true);

    final savedCharities = allSelected? user.getSavedCharitiesInFolder(widget.folderName) : user.getRecentlyAdded(widget.folderName);
    print("length of savedCharities: ${savedCharities.length}");

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
                    'My ${widget.folderName} Charities',
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
          Row(
            children: [
              SizedBox(width: 25),
              GestureDetector(
                child: Container(
                  child: Text('All',
                    style: TextStyle(
                        fontSize: 16,
                        color: allSelected ? Colors.white : Colors.black
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                      color: allSelected ? AppTheme().primaryColor : Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 15
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                onTap: (){
                  setState(() {
                    allSelected = true;
                  });
                },
              ),
              SizedBox(width: 15),
              GestureDetector(
                child: Container(
                  child: Text('Recently Added',
                    style: TextStyle(
                        color: allSelected ? Colors.black : Colors.white,
                        fontSize: 16
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                      color: allSelected ? Colors.white : AppTheme().primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 15
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                onTap: (){
                  setState(() {
                    allSelected = false;
                  });
                },
              )
            ],
          ),
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