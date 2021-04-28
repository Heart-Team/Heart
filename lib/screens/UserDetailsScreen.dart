import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Suggestions.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/EditInfoScreen.dart';
import 'package:heart_app/screens/SurveyScreen1.dart';
import 'package:heart_app/widgets/profile/AddCardDialog.dart';
import 'package:heart_app/widgets/profile/ChangePasswordDialog.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:heart_app/widgets/MainDrawer.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../theme.dart';
import '../widgets/Payment/CreditCard.dart';

class UserDetailsScreen extends StatelessWidget {
  static const routeName = '/user-details';

  final _itemScrollController = ItemScrollController();

  void changePasswordDialog(BuildContext context){
    Alert(
      buttons: [],
      style: AlertStyle(
        alertPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        buttonAreaPadding: EdgeInsets.only(bottom: 10)
      ),
      title: 'Change Password',
      context: context,
      content: ChangePasswordDialog()
    ).show();
  }

  void addCard(BuildContext context){
    Alert(
      buttons: [],
      style: AlertStyle(

        alertPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        buttonAreaPadding: EdgeInsets.only(bottom: 10)
      ),
      title: 'Enter Your Card Info',
      context: context,
      content: AddCardDialog()
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: deviceSize.height * 0.52,
              width: deviceSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(
                        deviceSize.width * 0.6, deviceSize.height * 0.25)),
                color: AppTheme().primaryColor.withOpacity(0.3),
              ),
            ),
            top: 0,
            left: 0
          ),
          Positioned(
            child: Container(
              height: deviceSize.height * 0.25,
              width: deviceSize.width * 0.75,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.elliptical(120, 120)),
                color: AppTheme().primaryColor.withOpacity(0.3),
              ),
            ),
            bottom: 0,
            right: 0
          ),
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(10, 55, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: user.imageUrl.isEmpty ? AssetImage(
                        "assets/images/user/blank_user.png",
                      ) : NetworkImage(user.imageUrl),
                      radius: 45,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              user.fullName != null ? user.fullName : '',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(
                                Icons.edit_outlined,
                                color: AppTheme().primaryColor,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(builder: (ctx) => EditInfoScreen())
                                );
                              },
                            )
                          ],
                        ),
                        Text(
                          (user.location != null && user.location.isNotEmpty) ? user.location : 'Location Not Set',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600, 
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 5),
                        GestureDetector(
                          child: Text(
                            'Change Password',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppTheme().primaryColor),
                          ),
                          onTap: () => changePasswordDialog(context),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          child: Text(
                            'Update Survey Preferences',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppTheme().primaryColor),
                          ),
                          onTap: () => Navigator.of(context).pushNamed(
                            SurveyScreen.routeName,
                            arguments: 'editing' 
                          )
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      'My Wallet',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    child: ScrollablePositionedList.builder(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      itemCount: user.cards.length + 1,
                      itemScrollController: _itemScrollController,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (ctx, index){
                        print(user.cards); 
                        if(index < user.cards.length)
                          return CreditCard(
                            user.cards[index]['cardInfo']['cardNumber'],
                            user.cards[index]['cardInfo']['expDate'],
                            user.cards[index]['cardInfo']['fullName'],
                            user.cards[index]['cardInfo']['type'],
                            itemScrollController: _itemScrollController,
                            index: index,
                            cardsLength: user.cards.length,
                          );
                        return FloatingActionButton(
                          child: Icon(Icons.add),
                          elevation: 0,
                          backgroundColor: AppTheme().primaryColor,
                          onPressed: () => addCard(context),
                        );
                    })   
                  )
                ],
              )
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 5,
            left: 10,
            child: IconButton(
              icon: Icon(
                Icons.keyboard_backspace, 
                color: Colors.white, size: 35
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
