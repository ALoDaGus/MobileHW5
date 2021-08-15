
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    var numButton = (int num) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            (num).toString(),
            style: TextStyle(fontSize: 30),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(35),
            primary: Colors.teal[100],
            onPrimary: Colors.teal,
          ),
        ),
      );
    };

    var deleteButton = () {
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: TextButton(
          onPressed: () {},
          child: Icon(
            Icons.backspace_outlined,
            size: 30,
            color: Colors.teal[100],
          ),
        ),
      );
    };

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.teal[100]!, Colors.teal],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.teal[900]!,
                  width: 4,
                )),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Column(
                children: [
                  Icon(Icons.lock_outline, size: 60.0, color: Colors.teal[900]),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('กรุณาใส่รหัสผ่าน',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.teal[900])),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                for (var i = 0; i < 3; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var j = 1; j <= 3; j++) numButton((i * 3 + j) % 10)
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 70.0),
                    ),
                    numButton(0),
                    deleteButton()
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'ลืมรหัสผ่าน',
              style: TextStyle(color: Colors.teal[100]),
            ),
          )
        ],
      ),
    );
  }
}
