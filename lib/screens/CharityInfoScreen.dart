import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Charity.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:provider/provider.dart';
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
          Stack(
            children: <Widget>[
              Hero(
                tag: productInfo['ein'],
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(
                          productInfo['imageUrl'],
                        ),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.85), BlendMode.dstATop),
                        fit: BoxFit.cover,
                      )),
                  padding: EdgeInsets.only(top: size.height * 0.3),
                  child: null,
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
          Container(
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
              margin: EdgeInsets.only(top: 10),
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
                  ]))
        ],
      ),
    );
  }
}
