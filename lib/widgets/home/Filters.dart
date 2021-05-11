import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Filter.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/home/ClearFilter.dart';
import 'package:heart_app/widgets/home/DropdownButton.dart';
import 'package:heart_app/widgets/home/FilterDialog.dart';
import 'package:heart_app/widgets/home/SortByButton.dart';
import 'package:heart_app/widgets/surveys/SurveyChip.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Filters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<Filter>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilterDialog(),
          SortByButton(),
          if(filter.isFiltering)
            ClearFilter()
        ],
    );
  }
}