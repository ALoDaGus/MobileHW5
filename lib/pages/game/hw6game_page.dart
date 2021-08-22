import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<int> list = [1, 2, 3];
  bool showNumber = true;
  String pic = 'assets/images/p.png';

  _handleClickButton() {
    setState(() {
      list = list.map((e) => e + 1).toList();
    });
  }

  _handleClickButton2() {
    setState(() {
      // list.add(list.last + 1);
      showNumber = !showNumber;
    });
  }

  _changePic() {
    setState(() {
      pic = 'assets/images/op.png';
      print('test2');
    });
  }

  _changePic2() {
    setState(() {
      pic = 'assets/images/p.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (_) {
          setState(() {
            pic = 'assets/images/op.png';
          });
        },
        onTapUp: (_) {
          setState(() {
            pic = 'assets/images/p.png';
          });
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(pic),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (showNumber)
                  for (var item in list)
                    Text(item.toString(), style: TextStyle(fontSize: 30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: _handleClickButton, child: Text('TEST')),
                    SizedBox(width: 30),
                    Stack(
                      children: [
                        TextButton(
                            onPressed: _handleClickButton2,
                            child: Text('TEST2'))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
