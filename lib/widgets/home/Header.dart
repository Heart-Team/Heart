import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 5),
        Expanded(
          child: Container(
            child: Text(
              'Find your charities here',
              softWrap: true,
              style:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.25), blurRadius: 15)
          ], shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: user.imageUrl.isEmpty ? Image.asset(
                "assets/images/user/blank_user.png",
                fit: BoxFit.cover
            ) : FadeInImage(
              placeholder: AssetImage(
                "assets/images/user/blank_user.png",
              ), 
              image:  NetworkImage(
                user.imageUrl,
              ),
              fit: BoxFit.cover,
            )
          ),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}