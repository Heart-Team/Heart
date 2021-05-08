import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Charity.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/Website.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/utilities/GetDate.dart';
import 'package:provider/provider.dart';

class CharityInfo extends StatefulWidget {

  final ein;

  CharityInfo(this.ein);

  @override
  _CharityInfoState createState() => _CharityInfoState();
}

class _CharityInfoState extends State<CharityInfo>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final charityInfo = Provider.of<Charity>(context).charityDetails;
    final user = Provider.of<User>(context, listen: true);

    var isFavorite = user.isInFavorate(widget.ein);


    return Padding(
      padding: EdgeInsets.only(left: 18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        SizedBox(
          height: size.height * 0.04,
        ),
        Text(
            charityInfo['charityName'] != null
                ? charityInfo['charityName']
                : 'Loading...',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
        Row(children: <Widget>[
          Expanded(
            child: Text(
                charityInfo['address'] != null
                    ? charityInfo['address']
                    : 'Loading...',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400)),
          ),
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 26),
              child: IconButton(
                splashColor: Colors.transparent,
                  icon:Icon( isFavorite ? (Icons.favorite_rounded):(Icons.favorite_outline_rounded), //here needs to have a condition
                        size: 30,
                      color: isFavorite ? AppTheme().primaryColor : Colors.grey,
                  ),
                onPressed: () async {
                  if (!isFavorite) {
                    // here add the charity into favorites array
                    await user.addFavorite(widget.ein, charityInfo['charityName'], charityInfo['categoryName'], GetDate().getDateNow());
                  }else{
                    // here remove the charity from the array
                    await user.removeFavorite(widget.ein, charityInfo['charityName'],charityInfo['categoryName'], GetDate().getDateNow());
                  }
                  setState(() {
                    isFavorite = !isFavorite;
                  });
              }),
          )
        ]),
        SizedBox(
          height: 24,
        ),
        Text('Their Mission',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        Text(
            charityInfo['mission'] != null
                ? charityInfo['mission']
                : 'Loading...',
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
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400)),
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
        Text('Learn More:',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Website.routeName,
                arguments: {'link': charityInfo['website']});
          },
          child: Text(
              charityInfo['website'] != null
                  ? charityInfo['website']
                  : 'Loading...',
              style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400,
                color: Colors.blue
              )
          ),
        ),
      ]),
    );
  }


}
