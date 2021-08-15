import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int? myNum;

  void _randNum() {
    setState(() {
        myNum = Random().nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    _randNum();
    List<Widget> iconList = [];
    
    for(var i = 0; i < 4; i++) {
      iconList.add(Icon(Icons.star, color: Colors.orange));
    }
    iconList.add(Icon(Icons.star_border_outlined, color: Colors.orange));

    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
      ),
      body: Container(
        color: Colors.teal[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                // color: Colors.teal[100],
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.teal[200]!, Colors.lightGreen[300]!, Colors.red[300]!],
                ),
              ),
              margin: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person, 
                    size: 80.0,
                    color: Colors.blue,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ธัชพล ออสุวรรณ',
                        style: TextStyle(fontSize: 20, color: Colors.teal[800], fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: iconList,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              myNum.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 177, color: Colors.teal),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: _randNum,
                  child: Text('RANDOM'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
