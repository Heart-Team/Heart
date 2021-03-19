import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Auth with ChangeNotifier {

  String _userId;
  String _token;
  bool _surveyTaken;
  String _firstPage;
  
  bool get isAuth {
    return _token != null;
  }

  bool get surveyTaken {
    if(_token != null)
      return _surveyTaken;
    else 
      return false;
  }

  String get token {
    return _token;
  }

  String get firstPage {
    return _firstPage;
  }

  Future<void> submitAuthForm(String email, String password, String fullName, bool loginMode, BuildContext context) async {

    final _auth = FirebaseAuth.instance;
    AuthResult authResult;

    try {
      if (loginMode) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email, 
          password: password
        );

        // update the local variables to the ones on the db
        final res = await authResult.user.getIdToken();
        _userId = authResult.user.uid;
        _token = res.token;

        print(_userId);
        print(_token);
        print(_surveyTaken);
        notifyListeners();
      } else {
        // firebase create
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email, 
          password: password
        );

        await Firestore.instance
          .collection('Users')
          .document(authResult.user.uid)
          .setData({'fullName': fullName, 'email': email, 'surveyTaken': false});

        // private member updates
        final res = await authResult.user.getIdToken();
        _userId = authResult.user.uid;
        _token = res.token;
        print(authResult.user);
        notifyListeners();
      }
    } on PlatformException catch (err) {
      var message = 'An error occurred, please check you credentials';
      if (err.message != null) message = err.message;
      Flushbar(
        messageText: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        borderRadius: 10,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 3),
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      ).show(context);
    } catch (e) {
      Flushbar(
        messageText: Text(
          e.message,
          style: TextStyle(color: Colors.white),
        ),
        borderRadius: 10,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 3),
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      ).show(context);
    }
  }

  Future<bool> surveyCompleted() async {
    final userData = await Firestore.instance
      .collection('Users')
      .document(_userId)
      .get();
    
    _surveyTaken = userData['surveyTaken'];
    _firstPage = _surveyTaken ? 'tabscreen' : 'surveyscreen';
    return _surveyTaken;
  }

  Future<void> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      _userId = null;
      _token = null;
      _surveyTaken = false;
      notifyListeners();
    } catch (e) {
      print('error');
    }
  }

}