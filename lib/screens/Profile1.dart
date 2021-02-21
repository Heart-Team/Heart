import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';

import '../theme.dart';
import '../widgets/CreditCard.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final charities = [
      {
        'name': 'Animals Charity',
        'category': 'Humanitarian Work',
        'image':
            'https://ichef.bbci.co.uk/news/1024/cpsprodpb/151AB/production/_111434468_gettyimages-1143489763.jpg'
      },
      {
        'name': 'Childrens Charity',
        'category': 'Social work',
        'image':
            'https://miro.medium.com/max/11326/1*6vDpSiK73AwHk6kG47ZrqQ.jpeg'
      },
      {
        'name': 'Cancer Awareness',
        'category': 'Research',
        'image':
            'https://www.nfcr.org/wp-content/uploads/2020/03/Cancer-research-is-t-worth-your-dime.jpg'
      },
      {
        'name': 'Veteran Support',
        'category': 'Social Work',
        'image':
            'https://nvf.org/wp-content/uploads/2016/07/veteran-support.jpg'
      },
      {
        'name': 'Charity Support',
        'category': 'Social Work',
        'image':
            'https://nvf.org/wp-content/uploads/2016/07/veteran-support.jpg'
      },
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: Stack(
          children: [
            Positioned(
                child: Container(
                  height: deviceSize.height * 0.52,
                  width: deviceSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(
                            deviceSize.width * 0.6, deviceSize.height * 0.25)),
                    color: AppTheme().primaryColor.withOpacity(0.3),
                  ),
                ),
                top: 0,
                left: 0),
            Positioned(
                child: Container(
                  height: deviceSize.height * 0.25,
                  width: deviceSize.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.elliptical(120, 120)),
                    color: AppTheme().primaryColor.withOpacity(0.3),
                  ),
                ),
                bottom: 0,
                right: 0),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 55, horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn.chv.me/images/thumbnails/Silicone-LED-Night-Light-Cute-qepw5Oxu.jpeg.thumb_800x800.jpg'),
                        radius: 45,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 22),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.edit_outlined,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'New York, NY',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Account Settings',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        'Saved Charities',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        'Animals Charity',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        'Children Charity',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        'Tech Charity',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        'Domestic Vlolence Charity',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        'Our Suggestions',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
}
