import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int myNum = 0;

  void _randNum() {
    setState(() {
        myNum = Random().nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    _randNum();
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
      ),
      body: Container(
        color: Colors.teal[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.teal[100],
              child: Row(
                children: [
                  Icon(
                    Icons.person, // รูปไอคอน
                    size: 80.0, // ขนาดไอคอน
                    color: Colors.blue, // สีไอคอน
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ธัชพล ออสุวรรณ',
                        style: TextStyle(fontSize: 20, color: Colors.teal[700]),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate, // รูปไอคอน
                            size: 20.0, // ขนาดไอคอน
                            color: Colors.teal[700], // สีไอคอน
                          ),
                          Icon(
                            Icons.star_rate, // รูปไอคอน
                            size: 20.0, // ขนาดไอคอน
                            color: Colors.teal[700], // สีไอคอน
                          ),
                          Icon(
                            Icons.star_rate, // รูปไอคอน
                            size: 20.0, // ขนาดไอคอน
                            color: Colors.teal[700], // สีไอคอน
                          ),
                          Icon(
                            Icons.star_rate, // รูปไอคอน
                            size: 20.0, // ขนาดไอคอน
                            color: Colors.teal[700], // สีไอคอน
                          ),
                          Icon(
                            Icons.star_outline, // รูปไอคอน
                            size: 20.0, // ขนาดไอคอน
                            color: Colors.teal[700], // สีไอคอน
                          ),
                        ],
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
                child: ElevatedButton(
                  onPressed: () {
                    _randNum();
                  },
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
