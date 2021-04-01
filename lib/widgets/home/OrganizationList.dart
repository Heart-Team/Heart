import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Search.dart';
import 'package:heart_app/Providers/Survey.dart';
import 'package:heart_app/widgets/home/OrganizationTile.dart';
import 'package:heart_app/widgets/utilities/Loading.dart';
import 'package:provider/provider.dart';

class OrganizationList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final survey = Provider.of<Survey>(context);
    final search = Provider.of<Search>(context);

    return search.searchResults.length == 0 ? 
      FutureBuilder(
        future: survey.homeRecommendations(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          } else {
            final recommendations = survey.recommendations;
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) => OrganizationTile(
                recommendations[index]['charityName'],
                recommendations[index]['categoryName'],
                recommendations[index]['imageURL'],
                recommendations[index]['ein']
              ),
              itemCount: recommendations.length,
            );
          }
        },
      ) : ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, index){
          final searchResults = search.searchResults;
          return OrganizationTile(
            searchResults[index]['charityName'],
            searchResults[index]['categoryName'],
            searchResults[index]['imageURL'],
            searchResults[index]['ein']
          );
        },
        itemCount: search.searchResults.length,
      );
  }
}

// search
/*
  search.klength == 0
  show recommendation
  otherwise search results
*/
// recommendations