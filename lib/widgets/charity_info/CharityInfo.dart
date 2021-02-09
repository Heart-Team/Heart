import 'package:flutter/material.dart';

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
    return Column(
      children: <Widget>[Text('Children\'s Charity')],
    );
  }
}
