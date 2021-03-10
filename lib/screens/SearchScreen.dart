import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        backgroundColor: AppTheme().primaryColor,
        onPressed: (){},
      ),
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: AppTheme().primaryColor,
        actions:[IconButton(icon: Icon(Icons.search), onPressed: (){})],
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search charities here ...",
            hintStyle: TextStyle(color: Colors.white),
          ),
          controller: searchController,
        )
      )
    );
  }

}
