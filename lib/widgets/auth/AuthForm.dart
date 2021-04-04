import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Auth.dart';
import 'package:heart_app/theme.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatefulWidget {
  final double screenSize;

  AuthForm(this.screenSize);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> with TickerProviderStateMixin {
  String selectedField = '';
  var _isLogin = true;
  var _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {
    'fullName': '',
    'email': '',
    'password': ''
  };

  void _onSubmit() async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
        selectedField = "";
      });
      _formKey.currentState.save();
      await Provider.of<Auth>(context, listen: false).submitAuthForm(
        _formData['email'].trim(),
        _formData['password'].trim(),
        _formData['fullName'].trim(),
        _isLogin,
        context
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: SingleChildScrollView(
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
            AnimatedSize(
              vsync: this,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: _isLogin
                              ? SizedBox.shrink()
                              : Text(
                                  "Full Name",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: _isLogin
                              ? SizedBox.shrink()
                              : Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    selectedField == 'fullName'
                                        ? BoxShadow(
                                            color: Colors.black12
                                                .withOpacity(0.15),
                                            blurRadius: 20)
                                        : BoxShadow(color: Colors.transparent)
                                  ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        key: ValueKey("Fullname"),
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                Icons.account_circle_outlined,
                                                color: selectedField ==
                                                        'fullName'
                                                    ? AppTheme().primaryColor
                                                    : Colors.grey),
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    style: BorderStyle.none)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[300],
                                                  width: 0.8),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey[300],
                                                        width: 0.8)),
                                            focusColor: Colors.red,
                                            hintText: "John Doe",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 13,
                                                    horizontal: 10)),
                                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                                        onTap: () {
                                          setState(() {
                                            selectedField = 'fullName';
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isEmpty)
                                            return "Please Enter Your Full Name";

                                          return null;
                                        },
                                        onSaved: (value) {
                                          _formData['fullName'] = value;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            selectedField == 'email'
                                ? BoxShadow(
                                    color: Colors.black12.withOpacity(0.15),
                                    blurRadius: 20)
                                : BoxShadow(color: Colors.transparent)
                          ]),
                          child: TextFormField(
                            key: ValueKey("Email"),
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined,
                                    color: selectedField == 'email'
                                        ? AppTheme().primaryColor
                                        : Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(style: BorderStyle.none)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey[300], width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey[300], width: 0.8)),
                                focusColor: Colors.red,
                                hintText: "JohnDoe@email.com",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 10)),
                            onTap: () {
                              setState(() {
                                selectedField = 'email';
                              });
                            },
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _formData['email'] = value;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            selectedField == 'password'
                                ? BoxShadow(
                                    color: Colors.black12.withOpacity(0.15),
                                    blurRadius: 20)
                                : BoxShadow(color: Colors.transparent)
                          ]),
                          child: TextFormField(
                            key: ValueKey("Password"),
                            obscureText: true,
                            decoration: InputDecoration(
                                errorMaxLines:
                                    2, // number of lines the error text would wrap
                                prefixIcon: Icon(Icons.lock_open_outlined,
                                    color: selectedField == 'password'
                                        ? AppTheme().primaryColor
                                        : Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(style: BorderStyle.none)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey[300], width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey[300], width: 0.8)),
                                focusColor: Colors.red,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 10)),
                            onTap: () {
                              setState(() {
                                selectedField = 'password';
                              });
                            },
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty ||
                                  !RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}\$")
                                      .hasMatch(value))
                                return "Password must be 6 Characters, have atleast 1 uppercase letter, 1 lowercase letter and 1 number";

                              return null;
                            },
                            onSaved: (value) {
                              _formData['password'] = value;
                            },
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                              alignment: Alignment.center,
                              child: _isLoading
                                  ? Container(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        strokeWidth: 3,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppTheme().blue),
                                      ),
                                    )
                                  : Text(
                                      _isLogin ? 'Log In' : 'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                              height: 45,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
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
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26.withOpacity(0.15),
                                        blurRadius: 10)
                                  ])),
                          onTap: () {
                            _onSubmit();
                            // Navigator.pushReplacementNamed(
                            //   context,
                            //   SurveyScreen.routeName
                            // );
                          },
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    _isLogin
                        ? 'Don\'t have an account'
                        : "Already have an account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
