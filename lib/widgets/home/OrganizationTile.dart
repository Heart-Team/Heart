import 'package:flutter/material.dart';
import 'package:heart_app/screens/CharityInfoScreen.dart';
import 'package:heart_app/theme.dart';

class OrganizationTile extends StatefulWidget {
  final String title;
  final String category;
  final String imageUrl;
  final int assetAmount;
  final String state;
  final int rating;
  final String subsection;
  final int yearlyIncome;

  OrganizationTile(
    this.title,
    this.category,
    this.imageUrl, {
    this.assetAmount,
    this.rating,
    this.state,
    this.subsection,
    this.yearlyIncome,
  });

  @override
  _OrganizationTileState createState() => _OrganizationTileState();
}

class _OrganizationTileState extends State<OrganizationTile> {
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.title,
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
                        Navigator.of(context)
                            .pushNamed(CharityInfoScreen.routeName, arguments: {
                          'title': widget.title,
                          'imageUrl': widget.imageUrl,
                          'state': widget.state,
                          'rating': widget.rating,
                          'assetAmount': widget.assetAmount,
                          'subsection': widget.subsection,
                          'yearlyIncome': widget.yearlyIncome
                        });
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
                          onPressed: () {
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
