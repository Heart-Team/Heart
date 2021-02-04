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
                padding: EdgeInsets.only(top: 260.0, left: 30, right: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 68, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      Text("Email", style: TextStyle(fontSize: 22)),
                      SizedBox(height: 10),
                      TextFormField(
                          decoration: InputDecoration(
                        labelText: "john@doe.com",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        //fillColor: Colors.green
                      )),
                      SizedBox(height: 10),
                      Text("Password", style: TextStyle(fontSize: 22)),
                      TextFormField(
                          decoration: InputDecoration(
                        labelText: "",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      )),
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
                                colors: <Color>[
                                  Color(0xFFFF6464),
                                  Color(0xFFFBBEBE),
                                  Color(0xFFFF6464),
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 90.0, vertical: 8),
                            child: const Text('Login',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
