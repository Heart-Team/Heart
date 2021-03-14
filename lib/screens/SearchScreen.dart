import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_app/Services/DataController.dart';
import 'package:heart_app/widgets/App.dart';
import '../theme.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  final String text;
  SearchScreen({Key key, @required this.text}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;


  @override
  Widget build(BuildContext context) {
    searchController.text = widget.text;

    Widget searchedData(){
      return ListView.builder(
        itemCount: snapshotData.documents.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(snapshotData.documents[index]['imageURL']),
            ),
            title: Text(snapshotData.documents[index].data['charityName'],
            style: TextStyle(color:AppTheme().primaryColor, fontWeight: FontWeight.bold, fontSize: 20),),
            subtitle: Text(snapshotData.documents[index].data['causeName']+ "\n" + snapshotData.documents[index].data['state']  ,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 16),),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme().primaryColor,
        child:Icon(Icons.clear ),onPressed: (){
        searchController.clear();
        setState(() {
            isExecuted = false;
          });
      },
      ),
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
        child: Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please tap search button',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Image.asset('assets/images/empty_result.png'),
           ])
        )
      ),
    );


  }

}
