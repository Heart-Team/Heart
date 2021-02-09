import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';

import '../theme.dart';
import '../widgets/CreditCard.dart';
import '../widgets/charity_info/CharityInfo.dart';

class CharityInfoScreen extends StatelessWidget {
  static const routeName = '/charity-info';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      "assets/images/charity_info_screen/poverty.jpg"),
                  fit: BoxFit.cover,
                )),
                padding: EdgeInsets.only(top: size.height * 0.3),
                child: null,
              ),
              Container(
                  padding: EdgeInsets.only(top: size.height * 0.08, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/charity_info_screen/trending_flat_24px.png",
                    height: size.height * 0.03,
                  )),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: size.height * 0.22),
                child: new Container(
                    height: size.height * 0.66,
                    width: size.width,
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),

                      color: Colors.white,
                      // elevation: 3.0,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: CharityInfo(
                            'Childrens Charity',
                            ' New York, NY',
                            'Supporting children all over U.S.',
                            '    sample starts here...\n\n\nsample\n\nsample',
                            'Total Assets - \$ 100,213.00\nYearly Income - \$ 2, 130.00\nTax Subsection - 501(c)(3)',
                            'https://google.com'),
                      ),
                    )),
              )
            ],
          ),
          Container(
              alignment: Alignment.center,
              child: Text(
                'Add to Basket',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              height: size.height * 0.05,
              width: size.width * 0.6,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xFFFF6464),
                      Color(0xFFFBBEBE),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26.withOpacity(0.15), blurRadius: 10)
                  ]))
        ],
      ),
    );
  }
}
