import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/profile/EditInfoForm.dart';
import 'package:heart_app/widgets/profile/ImagePicker.dart';
import 'package:provider/provider.dart';

class EditInfoScreen extends StatefulWidget {
  static const routeName = '/edit-info';

  @override
  _EditInfoScreenState createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {

  String _imageUrl;
  String _fullName;
  String _location;
  bool _dataSaved = true;
  bool _isLoading = false;
  bool _showSuccess = false;

  void editInfo({String imageUrl, String fullName, String location}){
    _dataSaved = false;
    if(imageUrl != null){
      _imageUrl = imageUrl;
    }
    if(fullName != null){ 
      _fullName = fullName;
    }
    if(location != null){
      _location = location;
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Unsaved Changes'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Changes made to your profile have not been saved. Are you sure you want to go back?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void submit() async {
    if(_fullName != null || _location != null || _imageUrl != null){
      setState(() => _isLoading = true);
      await Provider.of<User>(context, listen: false).editInfo(_fullName, _location, _imageUrl);
      setState(() {
        _isLoading = false;
        _showSuccess = true;
      });
      Timer(Duration(seconds: 2), () => setState(() => _showSuccess = false));
      _dataSaved = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(15, 40, 15, 10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Edit My Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30),
                  UserImagePicker(editInfo),
                  SizedBox(height: 40),
                  EditInfoForm(editInfo),
                  SizedBox(height: 30),

                  MaterialButton(
                    color: AppTheme().primaryColor,
                    elevation: 0, 
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: _isLoading ? Container(
                      height: 20,
                      width: 20,
                      color: Colors.transparent,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ) : Text(
                      _showSuccess ? 'Profile Updated ✔' : 'Apply Changes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    onPressed: submit
                  )
                ],
              ),
            ),
            Positioned(
              top: -5.5,
              left: 0,
              child: IconButton(
                icon: Icon(Icons.keyboard_backspace, size: 35),
                onPressed: () {
                  if(!_dataSaved)
                    _showMyDialog();
                  else
                    Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
