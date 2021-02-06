import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/MainDrawer.dart';
import '../widgets/SurveyGridItem.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MainDrawer(),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_screen/heart_figure.png",
                width: size.width * 0.55,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 240.0, left: 30, right: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 68, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      Text("Email",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600)),
                      SizedBox(height: 5),
                      Container(
                          height: 48,
                          child: TextFormField(
                              decoration: InputDecoration(
                            labelText: "john@doe.com",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ))),
                      SizedBox(height: 15),
                      Text("Password",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600)),
                      Container(
                          height: 48,
                          child: TextFormField(
                              decoration: InputDecoration(
                            // labelText: "",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ))),
                      Text("Forgot password?",
                          style: TextStyle(fontSize: 16, color: Colors.red)),
                      SizedBox(height: 30),
                      Center(
                        child: RaisedButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                            child: const Text('Login',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Center(
                        child: Text(
                          "Login with",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/login_screen/fb_logo.png",
                            width: size.width * 0.03,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            "assets/images/login_screen/twitter_logo.png",
                            width: size.width * 0.06,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/login_screen/Dont have an account_ Sign Upsignup_line.png",
                          width: size.width * 0.5,
                        ),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
