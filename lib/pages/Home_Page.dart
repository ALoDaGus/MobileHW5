import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({ Key? key }) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: Container(
        child: Text('This is home page.'),
      ),
    );
  }
}