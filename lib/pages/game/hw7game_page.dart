import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int currentNumber = 0;
  bool turn = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    _underLine() => const Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        );
    _incressNumber(int number) {
      setState(() {
        currentNumber += number;
        turn = !turn;
      });
    }

    _isEnd() {
      if (currentNumber >= 20) return true;
      return false;
    }

    _buttonNumber(number, color, turn) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: turn && !_isEnd() ? () => _incressNumber(number) : null,
            style: ElevatedButton.styleFrom(
              primary: color,
              padding: EdgeInsets.symmetric(
                  horizontal: (screenWidth / 12) + 10, vertical: 5.0),
            ),
            child: Text(
              number.toString(),
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        );

    _centerWidget(color, turn) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentNumber.toString(),
              style: TextStyle(
                  fontSize: 70.0,
                  color: color,
                  decoration: TextDecoration.none),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 60.0,
              color: turn == true ? color : Colors.grey,
            ),
          ],
        );

    return Container(
      decoration: const BoxDecoration(
        image: const DecorationImage(
          image: const AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RotatedBox(
              quarterTurns: 2,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [1, 2, 3]
                      .map((e) => _buttonNumber(e, Colors.red, !turn))
                      .toList()),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: _isEnd()
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            turn ? 'BLUE' : 'RED',
                            style: TextStyle(
                                fontSize: 70.0,
                                color: turn ? Colors.blue : Colors.red,
                                decoration: TextDecoration.none),
                          ),
                          Text(
                            'WIN !',
                            style: TextStyle(
                                fontSize: 50.0,
                                color: turn ? Colors.blue : Colors.red,
                                decoration: TextDecoration.none),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () => setState(() {
                                currentNumber = 0;
                                turn = true;
                              }),
                              style: ElevatedButton.styleFrom(
                                primary: turn ? Colors.blue : Colors.red,
                              ),
                              child: Text(
                                'NEW GAME',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      ))
                    : Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i = 0; i < 20; i++)
                                Icon(
                                  (i < currentNumber
                                      ? Icons.star_rate
                                      : Icons.star_border_outlined),
                                  color: Colors.deepPurpleAccent,
                                )
                            ],
                          ), //stars
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RotatedBox(
                                  quarterTurns: 2,
                                  child: _centerWidget(Colors.red, !turn)),
                              _underLine(),
                              _centerWidget(Colors.blue, turn)
                            ],
                          )),
                        ],
                      ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [1, 2, 3]
                    .map((e) => _buttonNumber(e, Colors.blue, turn))
                    .toList()),
          ],
        ),
      ),
    );
  }
}