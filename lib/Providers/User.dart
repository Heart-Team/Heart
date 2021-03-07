import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:heart_app/screens/SurveyScreen1.dart';
import 'package:heart_app/screens/TabsScreen.dart';

class User with ChangeNotifier {
  // userID
  // name/username
  // email
  // credit cards
  // image

  String _userId;
  String _fullName;
  String _email;
  List<Map<String, dynamic>> _creditCards;
  bool _surveyTaken;
  String _imageUrl;

  String get userId {
    return _userId;
  }

  String get fullName {
    return _fullName;
  }

  String get email {
    return _email;
  }

  String get imageUrl {
    return _imageUrl;
  }

  bool get surveyTaken {
    return _surveyTaken;
  }

  List<Map<String, dynamic>> get creditCards {
    return _creditCards;
  }

  // getCurrentUser
  Future getUserInfo(String userId) async {
    final user = await Firestore.instance.collection('Users').document(userId).get();
    return user.data;
  }

  // User login / sign up
  Future submitAuthForm(String email, String password, String fullName,
      bool loginMode, BuildContext context) async {
    // authenticate
    final _auth = FirebaseAuth.instance;
    AuthResult authResult;

    try {
      if (loginMode) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        // on success
        final user = await Firestore.instance
            .collection('Users')
            .document(authResult.user.uid)
            .get();
        _surveyTaken = user['surveyTaken'];
      } else {
        // firebase create
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await Firestore.instance
            .collection('Users')
            .document(authResult.user.uid)
            .setData(
                {'fullName': fullName, 'email': email, 'surveyTaken': false});

        // private member updates
        _fullName = fullName;
        _email = email;
        _userId = authResult.user.uid;
        _surveyTaken = false;
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

  // sign out
  Future signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
