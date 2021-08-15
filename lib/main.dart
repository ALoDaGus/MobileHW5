import 'dart:math';

import 'package:flutter/material.dart';

import 'pages/game/hw6game_page.dart';

void main() {
  
  // var centerWidget = Center(child: myText());

  //  runApp(centerWidget);

   runApp(MyApp());
}

class myText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rand = new Random().nextInt(100);

    var textStyle = new TextStyle(fontSize: 127, color: Colors.green[300]);
    return Text(
        rand.toString(), 
        textDirection: TextDirection.ltr,
        style: textStyle,
    );
  }

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