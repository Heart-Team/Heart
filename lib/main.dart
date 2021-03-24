import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Auth.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/utilities/Loading.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// screens
import 'package:heart_app/screens/CharityInfoScreen.dart';
import 'package:heart_app/screens/EditInfoScreen.dart';
import 'package:heart_app/screens/EmptyFinanceScreen.dart';
import 'package:heart_app/screens/FinanceScreen.dart';
import 'package:heart_app/screens/Profile1.dart';
import 'package:heart_app/screens/SavedCharitiesScreen.dart';
import 'package:heart_app/screens/Sucess.dart';
import 'package:heart_app/screens/SurveyScreen2.dart';
import 'package:heart_app/screens/TabsScreen.dart';
import 'package:heart_app/screens/UserDetailsScreen.dart';
import 'package:heart_app/screens/AuthScreen.dart';
import 'package:heart_app/screens/Cart.dart';
import 'package:heart_app/screens/PaymentMethodScreen.dart';
import 'screens/SurveyScreen1.dart';
import 'screens/AuthScreen.dart';
import 'screens/SearchScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => User(),
        // ),
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, User>(
          create: null,
          update: (_, auth, prevUser) => User(
            auth.userId,
          ),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, authData, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Heart',
          theme: ThemeData(
            fontFamily: 'Poppins',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: !authData.isAuth
              ? AuthScreen()
              : FutureBuilder(
                  future: authData.surveyCompleted(),
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Loading();
                    } else {
                      return snapshot.data ? TabScreen() : SurveyScreen();
                    }
                  }),
          routes: {
            SurveyScreen.routeName: (_) => SurveyScreen(),
            SurveyScreen2.routeName: (_) => SurveyScreen2(),
            UserDetailsScreen.routeName: (_) => UserDetailsScreen(),
            AuthScreen.routeName: (_) => AuthScreen(),
            CharityInfoScreen.routeName: (_) => CharityInfoScreen(),
            Cart.routeName: (_) => Cart(),
            TabScreen.routeName: (_) => TabScreen(),
            Suc.routeName: (_) => Suc(),
            SavedCharitiesScreen.routeName: (_) => SavedCharitiesScreen(),
            FinanceScreen.routeName: (_) => FinanceScreen(),
            PaymethodScreen.routeName: (_) => PaymethodScreen(),
            Profile.routeName: (_) => Profile(),
            EmptyFinanceScreen.routeName: (_) => EmptyFinanceScreen(),
            EditInfoScreen.routeName: (_) => EditInfoScreen(),
            SearchScreen.routeName: (_) => SearchScreen(),
          },
        ),
      ),
    );
  }
}