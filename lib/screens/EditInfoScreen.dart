import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';

class EditInfoScreen extends StatefulWidget {
  static const routeName = '/edit-info';

  @override
  _EditInfoScreenState createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: device.size.height,
        padding: EdgeInsets.fromLTRB(15, device.padding.top + 15, 15, 10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Edit My Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: CircleAvatar(
                      minRadius: 40,
                      maxRadius: 50,
                      backgroundImage: AssetImage(
                        "assets/images/user/blank_user.png"
                      ),
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
                  SizedBox(height: 40),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          width: device.size.width * 0.85,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                blurRadius: 15)
                          ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_outlined,
                                    color: Colors.grey),
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
                                hintText: "John Doe",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 10)),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: device.size.width * 0.85,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                blurRadius: 15)
                          ]),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.grey
                                ),
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
                                hintText: "Location",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    color: AppTheme().primaryColor,
                    elevation: 0, 
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text(
                      'Apply Changes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                    }
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
