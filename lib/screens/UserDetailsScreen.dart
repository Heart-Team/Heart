import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';

import '../theme.dart';
import '../widgets/CreditCard.dart';

class UserDetailsScreen extends StatelessWidget {

  static const routeName = '/user-details';

  final List<Map<String, String>> creditCards = [
    {
      'cardNumber': '1234 1234 1234 1234',
      'expDate': '12/2022',
      'cardType': 'visa'
    },
    {
      'cardNumber': '1234 1234 1234 1234',
      'expDate': '12/2022',
      'cardType': 'mastercard'
    },
    {
      'cardNumber': '1234 1234 1234 1234',
      'expDate': '12/2022',
      'cardType': 'mastercard'
    },
    
  ];

  @override
  Widget build(BuildContext context) {

    final deviceSize = MediaQuery.of(context).size;

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
                    deviceSize.width * 0.6, 
                    deviceSize.height * 0.25
                  )
                ),
                color: AppTheme().primaryColor.withOpacity(0.3),
              ),
            ),
            top: 0,
            left: 0
          ),
          Positioned(
            child: Container(
              height: deviceSize.height * 0.25,
              width: deviceSize.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(
                    120,
                    120
                  )
                ),
                color: AppTheme().primaryColor.withOpacity(0.3),
              ),
            ),
            bottom: 0,
            right: 0
          ),
          Container(
            // child: Image.network('https://cdn.chv.me/images/thumbnails/Silicone-LED-Night-Light-Cute-qepw5Oxu.jpeg.thumb_800x800.jpg')
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 55, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://cdn.chv.me/images/thumbnails/Silicone-LED-Night-Light-Cute-qepw5Oxu.jpeg.thumb_800x800.jpg'),
                    radius: 45,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Kamy Doe',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22
                            ),
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
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Change Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  child: Text(
                    'My Wallet',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (ctx, index) => CreditCard(
                        creditCards[index]['cardNumber'],
                        creditCards[index]['expDate'],
                        [index, index + 1],
                      ),
                      itemCount: creditCards.length,
                    ),
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}