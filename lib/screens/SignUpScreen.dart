import "package:flutter/material.dart";
import '../widgets/MainDrawer.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: MainDrawer(),
        body: ListView(shrinkWrap: true, children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 20,
                  left: 0,
                  child: FlatButton(
                      onPressed: null,
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: 40,
                      )),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/login_screen/heart_figure.png",
                    width: size.width * 0.40,
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(padding: EdgeInsets.only(top: 150.0, left: 100)),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Full Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle_outlined,
                                color: Colors.black),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                            labelText: "Full Name"),
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.email_outlined, color: Colors.black),
                            fillColor: Colors.white,
                            labelText: "Email"),
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.lock_outlined, color: Colors.black),
                            fillColor: Colors.white,
                            labelText: "Password"),
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFFFF6464),
                              Color(0xFFFBBEBE),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 140.0, vertical: 10),
                        child: const Text('Sign Up',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                      ),
                      Text("Already have an account?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      FlatButton(
                          onPressed: () {},
                          child: Container(
                              padding: EdgeInsets.zero,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Color(0xFFFF6464),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )))
                    ],
                  )
                ]),
              ],
            ),
          ),
        ]));
  }
}
