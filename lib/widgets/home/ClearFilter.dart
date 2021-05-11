import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Filter.dart';
import 'package:heart_app/Providers/Survey.dart';
import 'package:provider/provider.dart';

class ClearFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<Filter>(context, listen: false);
    return GestureDetector(
      onTap: (){
        if(filter.searchText.trim().isEmpty)
          Provider.of<Survey>(context, listen: false).resetRecommendations();
        else
          filter.search(filter.searchText.trim());
        
        filter.clearFiltering();
      },
      child: Row(
        children: [
          Text(
            'Clear Filter',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.grey[500]
            ),
          ),
          SizedBox(width: 5),
          Icon(
            Icons.cancel_rounded,
            size: 18,
            color: Colors.grey[500],
          )
        ],
      )
    );
  }
}