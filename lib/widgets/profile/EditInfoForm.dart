import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:provider/provider.dart';

class EditInfoForm extends StatefulWidget {

  final Function editInfo;

  EditInfoForm(this.editInfo);

  @override
  _EditInfoFormState createState() => _EditInfoFormState();
}

class _EditInfoFormState extends State<EditInfoForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    return Form(
      key: _formKey,
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
              initialValue: Provider.of<User>(context, listen: false).fullName,
              textInputAction: TextInputAction.next,
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
                      vertical: 13, horizontal: 10)
              ),
              onEditingComplete: (){
                FocusScope.of(context).nextFocus();
              },
              onChanged: (val){
                widget.editInfo(fullName: val);              
              },
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
            child: TextFormField(
              initialValue: Provider.of<User>(context, listen: false).location,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_city_outlined,
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
                      vertical: 13, horizontal: 10)
              ),
              onChanged: (val){
                widget.editInfo(location: val);    
              },
            ),
          ),
        ],
      ),
    );
  }
}