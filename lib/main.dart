import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syntaxfm_app/pages/home_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:syntaxfm_app/styles/my_colors.dart' as mColors;

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: mColors.backgroundView,
          centerTitle: true,
          elevation: 0,
        ),
        hoverColor: mColors.primaryColorHover,
        focusColor: mColors.primaryColorHover,
        accentColor: mColors.primaryColor,
        backgroundColor: mColors.backgroundView,
        scaffoldBackgroundColor: mColors.backgroundView,
      ),
      home: MyHomePage(),
    );
  }
}
