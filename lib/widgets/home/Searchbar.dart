import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
/*  final orgsDatabase = Firestore.instance;
  uploadData(String name) async {
    List<String> splitList = name.split(' ');
    List<String> indexList = [];
  }*/
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.15),
            blurRadius: 15
          )
        ]
      ),
      height: 48,
      child: Stack(
        children: [
          TextField(
            cursorColor: AppTheme().primaryColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              focusColor: AppTheme().primaryColor,
              hoverColor: AppTheme().primaryColor,
              filled: true,
              hintText: 'Search...',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[400]
              ),
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.search_outlined,
                color: AppTheme().primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  style: BorderStyle.none
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  style: BorderStyle.none
                ),

              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: (){
                print('searching...');// this prints to console to confirm it's working
                // below should return search results from the Cloud Firestore
                // returned results should be transformed into organization tiles
                // in the list view below
              },
              child: Container(
                height: 48,
                width: 60, 
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme().primaryColor,
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(10))
                ),
                child: Text(
                  'Go',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}