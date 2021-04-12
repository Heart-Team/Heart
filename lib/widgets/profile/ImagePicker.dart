import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserImagePicker extends StatefulWidget {

  final Function editInfo;

  UserImagePicker(this.editInfo);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {

  File _selectedImage;

  void pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    final res = await Provider.of<User>(context, listen: false).uploadImage(_selectedImage);
    widget.editInfo(imageUrl: res);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        child: CircleAvatar(
          backgroundColor: AppTheme().primaryColor,
          minRadius: 40,
          maxRadius: 50,
          // here the ternary will be either the current user image or the selected image from the picker
          backgroundImage: _selectedImage == null ? 
            (
              Provider.of<User>(context).imageUrl.isEmpty ? 
              AssetImage(
                "assets/images/user/blank_user.png"
              ) : NetworkImage(
                Provider.of<User>(context).imageUrl
              ) 
            ) : FileImage(_selectedImage),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -5,
                right: -5,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: AppTheme().green,
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(width: 3, color: Colors.white)),
                  child: Icon(Icons.camera_alt),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}