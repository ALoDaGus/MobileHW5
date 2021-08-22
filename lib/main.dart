import 'package:flutter/material.dart';

import 'pages/game/hw7game_page.dart';

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
      ),
      home: GamePage(),
    );
  }

}