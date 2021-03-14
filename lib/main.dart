import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/theme.dart';
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
        ChangeNotifierProvider(
          create: (_) => User(),
        ),
      ],
      child: Consumer<User>(
        builder: (ctx, userData, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Heart',
          theme: ThemeData(
            fontFamily: 'Poppins',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: // signout takes u back home?
            home: StreamBuilder(
              stream: FirebaseAuth.instance.onAuthStateChanged,
              builder: (ctx, streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting)
                  return Loading();
                else {
                  return user.isLoggedIn ? TabScreen() : AuthScreen();
                }
              },
            ),
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
