
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hw04/pages/Home_Page.dart';
import 'package:hw04/pages/login_page.dart';

import 'pages/food_page.dart';
import 'pages/game/game_page.dart';

void main() {
  
  // var centerWidget = Center(child: myText());

  //  runApp(centerWidget);

   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'architectsDaughter',
        textTheme: TextTheme(
          headline1: GoogleFonts.architectsDaughter(fontSize: 78.6, color: Colors.teal[800]),
          bodyText2: GoogleFonts.architectsDaughter(fontSize: 33.3, color: Colors.teal[800]),
          headline6: GoogleFonts.architectsDaughter(fontSize: 24.0, color: Colors.teal[800])

        )
      ),
      home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        Home_Page.routeName: (context) => const Home_Page(),
        food_page.routeName: (context) => const food_page(),
      },
      initialRoute: '/login',
    );
  }

}