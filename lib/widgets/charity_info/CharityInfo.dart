import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Charity.dart';
import 'package:heart_app/theme.dart';
import 'package:provider/provider.dart';

class CharityInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final charityInfo = Provider.of<Charity>(context).charityDetails;

    return Padding(
      padding: EdgeInsets.only(left: 18),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              charityInfo['charityName'] != null ? charityInfo['charityName'] : 'Loading...',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
            Stack(children: <Widget>[
              Text(
                charityInfo['address'] != null ? charityInfo['address'] : 'Loading...',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400
                )
              ),
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            Text(charityInfo['mission'] != null ? charityInfo['mission'] : 'Loading...',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 24,
            ),
            Text('About',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            Text(charityInfo['about'] != null ? charityInfo['about'] : 'Loading...',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 24,
            ),
            Text('Charity Finances',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            Text(
              "Asset Amount: ${charityInfo['assetAmount']}\nYearly Income : ${charityInfo['yearlyIncome']}\nTax Subsection : ${charityInfo['subsection']}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 24,
            ),
            Text('Learn More',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            Text(charityInfo['website'] != null ? charityInfo['website'] : 'Loading...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ]),
    );
  }
}
