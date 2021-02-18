import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';

class SavedCharityTile extends StatelessWidget {

  final String dateAdded;
  final String name;
  final String location;

  SavedCharityTile(this.dateAdded, this.name, this.location);

  @override
  Widget build(BuildContext context) {
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
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 16,
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
                onPressed: (){}
              ),
              IconButton(
                icon: Icon(Icons.delete), 
                onPressed: (){},
                color: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}