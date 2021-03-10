import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_app/Services/DataController.dart';
import '../theme.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    Widget searchedData(){
      return ListView.builder(
        itemCount: snapshotData.documents.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            // leading: CircleAvatar(
            //   backgroundImage: NetworkImage(snapshotData.documents[index]['imageURL']),
            // ),
            title: Text(snapshotData.documents[index].data.toString(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        backgroundColor: AppTheme().primaryColor,
        onPressed: (){},
      ),
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: AppTheme().primaryColor,
        actions:[
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val){
              return IconButton(icon:
                Icon(Icons.search),
                  onPressed: (){
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExecuted = true;
                      });
                    });
                  });
            },
          )],

        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search charities here ...",
            hintStyle: TextStyle(color: Colors.white),
          ),
          controller: searchController,
        )
      ),
      body: isExecuted ? searchedData() : Container(
        child: Center(child:Text('Empty search results')),
      ),
    );
  }

}
