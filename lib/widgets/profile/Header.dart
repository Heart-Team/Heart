import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/UserDetailsScreen.dart';
import 'package:heart_app/theme.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            backgroundImage: user.imageUrl.isEmpty ? AssetImage(
              "assets/images/user/blank_user.png") : NetworkImage('https://www.petakids.com/wp-content/uploads/2015/11/Cute-Red-Bunny.jpg',
            ),
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
                    color: Colors.grey[500]),
              ),
              GestureDetector(
                child: Text(
                  'Account Settings',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme().primaryColor),
                ),
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (ctx) => UserDetailsScreen()));
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}