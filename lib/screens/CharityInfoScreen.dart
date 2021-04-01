import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Charity.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../widgets/charity_info/CharityInfo.dart';

class CharityInfoScreen extends StatefulWidget {
  static const routeName = '/charity-info';

  @override
  _CharityInfoScreenState createState() => _CharityInfoScreenState();
}

class _CharityInfoScreenState extends State<CharityInfoScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final productInfo = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    Provider.of<Charity>(context, listen: false).getCharityInfo(productInfo['ein']);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productInfo = ModalRoute.of(context).settings.arguments as Map<String, Object>;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: productInfo['ein'],
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    // decoration: BoxDecoration(
                    //     color: Colors.black,
                    //     image: DecorationImage(
                    //       image: NetworkImage(
                    //         productInfo['imageUrl'],
                    //       ),
                    //       colorFilter: ColorFilter.mode(
                    //           Colors.black.withOpacity(0.85), BlendMode.dstATop),
                    //       fit: BoxFit.cover,
                    //     )),
                    // padding: EdgeInsets.only(top: size.height * 0.3),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/homescreen/placeholder.png'),
                      image: NetworkImage(productInfo['imageUrl']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).viewPadding.top + 5,
                    left: 10,
                    child: IconButton(
                        icon: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: size.height * 0.23),
                  child: new Container(
                      height: size.height * 0.68,
                      width: size.width,
                      child: new Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(25))),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: CharityInfo(),
                        ),
                      )),
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: (){
                Alert(
                  context: context,
                  title: 'Amount To Donate',
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Add",
                        style:
                            TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: AppTheme().primaryColor,
                      radius: BorderRadius.circular(10.0),
                    ),
                    DialogButton(
                      child: Text(
                        "Cancel",
                        style:
                            TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.grey,
                      radius: BorderRadius.circular(10.0),
                    ),
                  ],
                  content: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                              Icons.attach_money
                          ),
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
                          hintText: "25",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                            ),
                          contentPadding: EdgeInsets.symmetric(
                                vertical: 13,
                                horizontal: 10
                            )
                      ),
                      validator: (value) {
                        if (value.isEmpty)
                          return "Please Enter Your Full Name";

                        return null;
                      },
                    ),
                  ),
                  style: AlertStyle(
                  animationType: AnimationType.grow,
                  backgroundColor: Colors.white.withOpacity(0.85),
                  overlayColor: Colors.black12.withOpacity(0.8),
                  titleStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                  )).show();
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Add to Basket',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                height: size.height * 0.05,
                width: size.width * 0.6,
                margin: EdgeInsets.only(top: 10, bottom: 15),
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
                          color: Colors.black26.withOpacity(0.15), blurRadius: 10)
                    ])),
          )
        ],
      ),
    );
  }
}
