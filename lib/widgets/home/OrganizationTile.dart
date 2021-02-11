import 'package:flutter/material.dart';
import 'package:heart_app/screens/CharityInfoScreen.dart';
import 'package:heart_app/theme.dart';

class OrganizationTile extends StatelessWidget {

  final String title;
  final String category;
  final String imageUrl;
  final bool isFavorite;

  OrganizationTile(
    this.title,
    this.category,
    this.imageUrl,
    this.isFavorite
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(bottom: 10,),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ListTile( 
              onTap: (){
                Navigator.of(context).pushNamed(CharityInfoScreen.routeName);
              },
              contentPadding: EdgeInsets.all(10),
              tileColor: Colors.black.withOpacity(0.25),
              title: Text( 
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
                ),
              ),
              subtitle: Text(
                category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 6, 
              child: IconButton(
                icon: Icon(
                  isFavorite ? (Icons.favorite_rounded) : (Icons.favorite_outline_rounded),
                  size: 30,
                  color: isFavorite ? AppTheme().primaryColor : Colors.white,
                ), 
                onPressed: (){

                }
              ),
            )
          ],
        ),
      ),
    );
  }
}