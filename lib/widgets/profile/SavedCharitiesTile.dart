import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/screens/SavedCharitiesScreen.dart';
import 'package:heart_app/theme.dart';

class SavedCharitiesTile extends StatelessWidget {

  final String name;
  SavedCharitiesTile(this.name);

  @override
  Widget build(BuildContext context) {

    int randomNumber = Random().nextInt(6);

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (_) => SavedCharitiesScreen(folderName: name))
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,   
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme().colorsArray[randomNumber],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 15
            )
          ]
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18
          ),
        )
      ),
    );
  }
}