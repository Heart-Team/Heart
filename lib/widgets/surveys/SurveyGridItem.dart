import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Survey.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:provider/provider.dart';
import '../../theme.dart';

class SurveyGridItem extends StatefulWidget {
  final String categoryName;
  final String image;

  SurveyGridItem(this.categoryName, this.image);

  @override
  _SurveyGridItemState createState() => _SurveyGridItemState();
}

class _SurveyGridItemState extends State<SurveyGridItem> {
  var _selected = false;
  var survey;

  @override
  void initState() {
    survey = Provider.of<Survey>(context, listen: false);
    super.initState();
  }

  void onTap() {
    setState(() {
      if (survey.relevantMacros.length < 4 && !_selected) {
        _selected = true;
        if (_selected) {
          survey.addMacro(widget.categoryName);
        }
      } else {
        if (_selected) {
          survey.removeMacro(widget.categoryName);
        }
        _selected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          // margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _selected
                  ? AppTheme().primaryColor.withOpacity(0.3)
                  : Colors.white,
              boxShadow: _selected
                  ? null
                  : [
                      BoxShadow(
                          color: Colors.black26.withOpacity(0.15),
                          blurRadius: 8)
                    ]),
          child: GridTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.contain,
                    scale: 0.9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.categoryName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
