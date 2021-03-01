import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/home/OrganizationTile.dart';
import 'package:heart_app/widgets/surveys/SurveyChip.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// widgets
import '../widgets/MainDrawer.dart';
import '../widgets/home/Searchbar.dart';

class HomeScreen extends StatelessWidget {
    
  // static const routeName = '/';

  final charities = [
    {
      'name': 'Childrens Charity',
      'category': 'Social work',
      'isFavorite': false,
      'image': 'https://miro.medium.com/max/11326/1*6vDpSiK73AwHk6kG47ZrqQ.jpeg'
    },
    {
      'name': 'Animals Charity',
      'category': 'Humanitarian Work',
      'isFavorite': true,
      'image': 'https://ichef.bbci.co.uk/news/1024/cpsprodpb/151AB/production/_111434468_gettyimages-1143489763.jpg'
    },
    {
      'name': 'Cancer Awareness',
      'category': 'Research',
      'isFavorite': false,
      'image': 'https://www.nfcr.org/wp-content/uploads/2020/03/Cancer-research-is-t-worth-your-dime.jpg'
    },
    {
      'name': 'Veteran Support',
      'category': 'Social Work',
      'isFavorite': false,
      'image': 'https://nvf.org/wp-content/uploads/2016/07/veteran-support.jpg'
    }, 
    {
      'name': 'Charity Support',
      'category': 'Social Work',
      'isFavorite': false,
      'image': 'https://nvf.org/wp-content/uploads/2016/07/veteran-support.jpg'
    },
  ];
  final categoryNames = [
    {'name': 'Human Services'},
    {'name': 'Education'},
    {'name': 'International'},
    {'name': 'Human and Civil Rights'},
    {'name': 'Religion'},
    {'name': 'Animals'},
    {'name': 'Arts, Culture, Humanities'},
    {'name': 'Health'},
    {'name': 'Community Development'},
    {'name': 'Environment'},
    {'name': 'Research and Public Policy'},
  ];
  final states = [
    'Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Federated States of Micronesia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Marshall Islands','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Mariana Islands','Ohio','Oklahoma','Oregon','Palau','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virgin Island','Virginia','Washington','West Virginia','Wisconsin','Wyoming'];
  final ratings = [
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
  ];

  

  @override
  Widget build(BuildContext context) {

    final device = MediaQuery.of(context);
    bool taxExempt = false;

    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, device.padding.top + 15, 20, 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Find your charities here',
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 80,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.25),
                        blurRadius: 15
                      )
                    ],
                    shape: BoxShape.circle
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      'https://cdn.chv.me/images/thumbnails/Silicone-LED-Night-Light-Cute-qepw5Oxu.jpeg.thumb_800x800.jpg'
                    ),
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
            SizedBox(height: 35,),
            SearchBar(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    Alert(
                      context: context,
                      title: 'Filters',
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Apply",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          color: AppTheme().primaryColor,
                          radius: BorderRadius.circular(10.0),
                        ),
                        DialogButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          color: Colors.grey,
                          radius: BorderRadius.circular(10.0),
                        ),
                      ],
                      content: Container(
                        height: device.size.height * 0.55,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cause Name',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppTheme().primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Wrap(
                                runSpacing: 10,
                                spacing: 8,
                                children: categoryNames.map((e) => SurveyChip(e['name'])).toList(),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'Tax Exempt', 
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppTheme().primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Switch.adaptive(
                                value: taxExempt, 
                                onChanged: (val){
                                  taxExempt = val;
                                }
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'Location', 
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppTheme().primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10,),
                              DropdownButton<String>(
                                value: states[0],
                                items: states.map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e
                                  ),
                                )).toList(), 
                                onChanged: (val){}
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Ratings', 
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppTheme().primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                              DropdownButton<String>(
                                value: '1 star',
                                items: ['1 star', '2 star', '3 star', '4 star', '5 star'].map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e
                                  ),
                                )).toList(), 
                                onChanged: (val){}
                              ),
                            ],
                          ),
                        ),
                      ),
                      style: AlertStyle(
                        animationType: AnimationType.grow,
                        backgroundColor: Colors.white.withOpacity(0.85),
                        overlayColor: Colors.black12.withOpacity(0.8),
                        titleStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 26,
                          fontWeight: FontWeight.w600
                        ),
                        
                      )
                    ).show();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 9),
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: 'Sort By',
                        elevation: 16,
                        items: ['Sort By', 'One', 'Two', 'Three', 'Four'].map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ).toList(),
                      onChanged: (value){},
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) => OrganizationTile(
                  charities[index]['name'], 
                  charities[index]['category'], 
                  charities[index]['image'], 
                ),
                itemCount: charities.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}