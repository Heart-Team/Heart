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
            new Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              new Padding(padding: EdgeInsets.only(top: 260.0, left: 100)),
              Text(
                "Login",
                style: TextStyle(fontSize: 68, fontWeight: FontWeight.w600),
              ),
              new SizedBox(height: 20),
              Text("Email", style: TextStyle(fontSize: 22)),
              new SizedBox(height: 10),
              new TextFormField(
                  decoration: new InputDecoration(
                labelText: "john@doe.com",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              )),
              new SizedBox(height: 10),
              new Text("Password", style: TextStyle(fontSize: 22)),
              new TextFormField(
                  decoration: new InputDecoration(
                labelText: "",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  // borderRadius: new BorderRadius.circular(35.0),
                  borderSide: new BorderSide(),
                ),
              )),
              new Text("Forgot password?",
                  style: TextStyle(fontSize: 16, color: Colors.red)),
              new SizedBox(height: 30),
              new RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFFFF6464),
                        Color(0xFFFBBEBE),
                        Color(0xFFFF6464),
                      ],
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: const Text('Login',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
