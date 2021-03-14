import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';

class CharityInfo extends StatelessWidget {
  final String charityName;
  final String location;
  final String mission;
  final String about;
  final String finance;
  final String website;

  CharityInfo(
    this.charityName,
    this.location,
    this.mission,
    this.about,
    this.finance,
    this.website,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: 18),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(this.charityName,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
            Stack(children: <Widget>[
              Text(this.location,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400)),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 26),
                child: Icon(
                  Icons.favorite_rounded,
                  size: 30,
                  color: AppTheme().primaryColor,
                )
              )
            ]),
            SizedBox(
              height: 24,
            ),
            Text('Their Mission',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
            Text(this.mission,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 24,
            ),
            Text('About',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
            Text(this.about,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 24,
            ),
            Text('Charity Finances',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
            Text(this.finance,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 24,
            ),
            Text('Learn More',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
            Text(this.website,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ]),
    );
  }
}
