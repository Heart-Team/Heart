import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {

  final double screenSize;

  AuthForm(this.screenSize);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  String selectedField = '';
  var _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenSize,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 35),
            child: Text(
              _isLogin ? 'Log In' : "Sign Up",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(!_isLogin)
                    Text(
                      "Full Name",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  if(!_isLogin)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          selectedField == 'fullName' ? BoxShadow(
                            color: Colors.black12.withOpacity(0.15),
                            blurRadius: 20
                          ) : BoxShadow(color: Colors.transparent)
                        ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_outlined,
                                    color: Colors.black),

                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(style: BorderStyle.none)),
                                enabledBorder: UnderlineInputBorder(),
                                disabledBorder: UnderlineInputBorder(),
                                focusColor: Colors.red,
                                hintText: "John Doe",
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 13, horizontal: 10)
                            ),
                            onTap: (){
                              setState(() {
                                selectedField = 'fullName';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 10,),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          selectedField == 'email' ? BoxShadow(
                            color: Colors.black12.withOpacity(0.15),
                            blurRadius: 20
                          ) : BoxShadow(color: Colors.transparent)
                        ]
                      ),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined,
                              color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(style: BorderStyle.none)),
                          enabledBorder: UnderlineInputBorder(),
                          focusColor: Colors.red,
                          hintText: "JohnDoe@email.com",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 13, horizontal: 10)
                        ),
                        onTap: (){
                          setState(() {
                            selectedField = 'email';
                          });
                        },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        selectedField == 'password' ? BoxShadow(
                          color: Colors.black12.withOpacity(0.15),
                          blurRadius: 20
                        ) : BoxShadow(color: Colors.transparent)
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_open_outlined,
                              color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(style: BorderStyle.none)),
                          enabledBorder: UnderlineInputBorder(),
                          focusColor: Colors.red,
                          hintText: "Password",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 13, horizontal: 10)
                      ),
                      onTap: (){
                        setState(() {
                          selectedField = 'password';
                        });
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      _isLogin ? 'Log In' : 'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    height: 45,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xFFFF6464),
                          Color(0xFFFBBEBE),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26.withOpacity(0.15),
                          blurRadius: 10
                        )
                      ]
                    )
                  ),
                ],
              )
            ),
            SizedBox(height: 15),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _isLogin ? 'Don\'t have an account' : "Already have an account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                    GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin ? " Sign Up" : ' Log In',
                      style: TextStyle(
                          color: Color(0xFFFF6464),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 15)
        ],
      ),
    );
  }
}
