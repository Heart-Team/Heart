import "package:flutter/material.dart";
import '../widgets/MainDrawer.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: MainDrawer(),
        body: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/images/login_screen/heart_figure.png",
                        width: size.width * 0.50,
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 180.0, left: 100)),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 60, fontWeight: FontWeight.w600),
                          ),
                          Text("Full Name"),
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                        Icons.account_circle_outlined,
                                        color: Colors.black),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: "Full Name"),
                              )),
                          Text("Email"),
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined,
                                        color: Colors.black),
                                    fillColor: Colors.white,
                                    labelText: "Email"),
                              )),
                          Text("Password"),
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_outlined,
                                        color: Colors.black),
                                    fillColor: Colors.white,
                                    labelText: "Password"),
                              ))
                        ]),
                  ],
                ),
              ),
            ]));
  }
}
