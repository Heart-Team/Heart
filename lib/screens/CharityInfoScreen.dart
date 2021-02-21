import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import '../widgets/charity_info/CharityInfo.dart';

class CharityInfoScreen extends StatelessWidget {
  static const routeName = '/charity-info';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productInfo = ModalRoute.of(context).settings.arguments as Map<String, String>;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Hero(
                tag: productInfo['title'],
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: NetworkImage(
                          productInfo['imageUrl'],
                      ),
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.85), BlendMode.dstATop),
                      fit: BoxFit.cover,
                    )
                  ), 
                  padding: EdgeInsets.only(top: size.height * 0.3),
                  child: null,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).viewPadding.top + 5,
                left: 10,
                child: IconButton(
                  color: Colors.red,
                  icon: Icon(
                    Icons.keyboard_backspace, 
                    color: Colors.white,
                    size: 35,
                  ), 
                  onPressed: (){
                    Navigator.of(context).pop();
                  }
                )
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: size.height * 0.23),
                child: new Container(
                    height: size.height * 0.68,
                    width: size.width,
                    child: new Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(25))
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: CharityInfo(
                            'Childrens Charity',
                            ' New York, NY',
                            'Supporting children all over U.S.',
                            '    sample starts here...\n\n\nsample\n\nsample',
                            'Total Assets - \$ 100,213.00\nYearly Income - \$ 2, 130.00\nTax Subsection - 501(c)(3)',
                            'https://google.com'),
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
