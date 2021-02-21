import 'package:flutter/material.dart';
import 'package:heart_app/screens/UserDetailsScreen.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/home/OrganizationTile.dart';
import 'package:heart_app/widgets/profile/SavedCharitiesTile.dart';
import '../theme.dart';

class Profile extends StatelessWidget {

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final savedCharities = [
      'Animal Charities',
      'Domestic Violence',
      'Environmental',
      'Children',
      'Technology'
    ];

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
              padding: EdgeInsets.only(bottom: 55, left: 10, right: 10, top: 40),
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
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'New York, NY',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          GestureDetector(
                            child: Text(
                              'Account Settings',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue),
                            ),
                            onTap: (){
                              Navigator.of(context).pushNamed(UserDetailsScreen.routeName);
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 0),
                      child: Text(
                        'Saved Charities',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: GridView(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2/1,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15
                          ),
                          children: savedCharities.map((e) => SavedCharitiesTile(
                            e,
                          )).toList(), 
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
                      child: Text(
                        'Our Suggestions',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (ctx, index) => OrganizationTile(
                          charities[index]['name'], 
                          charities[index]['category'], 
                          charities[index]['image'], 
                        ),
                        itemCount: charities.length,
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
}
