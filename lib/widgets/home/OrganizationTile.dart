import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/CharityInfoScreen.dart';
import 'package:heart_app/theme.dart';
import 'package:provider/provider.dart';

class OrganizationTile extends StatefulWidget {
  final String title;
  final String category;
  final String imageUrl;
  final String ein;

  OrganizationTile(this.title, this.category, this.imageUrl, this.ein);

  @override
  _OrganizationTileState createState() => _OrganizationTileState();
}

class _OrganizationTileState extends State<OrganizationTile> {

  // here a function to decide if isFavorite is true or false
  // based on the data retrieved from firestore

  @override
  Widget build(BuildContext context) {
    // get the userId here
    final user = Provider.of<User>(context);
    var isFavorite = user.favorites.contains(widget.ein);
    
    return Hero(
      tag: widget.ein,
      child: Container(
        height: 130,
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: NetworkImage(widget.imageUrl),
          //   fit: BoxFit.cover,
          // ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              FadeInImage(
                placeholder:
                    AssetImage('assets/images/homescreen/placeholder.png'),
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
              Stack(
                fit: StackFit.expand,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          CharityInfoScreen.routeName,
                            arguments: {
                              'imageUrl': widget.imageUrl,
                              'title': widget.title,
                              'ein': widget.ein
                            }
                        );
                      },
                      contentPadding: EdgeInsets.all(10),
                      tileColor: Colors.black.withOpacity(0.25),
                      title: Text(
                        widget.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        widget.category,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 6,
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          icon: Icon(
                            isFavorite
                                ? (Icons.favorite_rounded)
                                : (Icons.favorite_outline_rounded),
                            size: 30,
                            color: isFavorite
                                ? AppTheme().primaryColor
                                : Colors.white,
                          ),
                          onPressed: () async {
                            if (!isFavorite) {
                              // here add the charity into favorites array
                              await user.addFavorite(widget.ein);
                            }else{
                              // here remove the charity from the array
                              await user.removeFavorite(widget.ein);
                            }
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          }),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
  what are we filtering on?
    likes array < 6 we do 1,2,3
    likes array > 6 we do 1 and 2
    1) Asset amount
    2) The survey suggestions (use 3 random micros)
    3) like micro category 

*/