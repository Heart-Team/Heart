import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Filter.dart';
import 'package:provider/provider.dart';

class ClearFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('tap');
        Provider.of<Filter>(context, listen: false).clearFiltering();
      },
      child: Text('Clear Filter')
    );
  }
}