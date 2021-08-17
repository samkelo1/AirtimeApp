
import 'package:flutter/material.dart';
import 'package:logistics/views/homePage/firstScreen.dart';
import 'package:logistics/views/homePage/homePage.dart';
import 'package:logistics/widgets&Helpers/helpers/styling.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Billing App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: scaffoldBgColor,
        primaryColor: primaryColor,
        fontFamily: 'Montserrat'
      ),
      home: IntroScreen(),
    );
  }
}
