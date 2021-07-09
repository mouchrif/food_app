import 'package:flutter/material.dart';
import 'package:food_app/screens/Sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/login_form_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme.of(context).copyWith(
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        primaryColor: Color(0xFFFFC529),
        accentColor: Color(0xFFFE724C),
      ),
      home: MyHomePage(title: 'Foody'),
      initialRoute: "/",
      routes: {
        // "/": (context) => LoginFormPage(),
        "/sign-up": (context) => SignUpScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return LoginFormPage();
  }
}
