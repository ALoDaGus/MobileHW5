import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Game _game;
  final TextEditingController _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;
  int count = 0;

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void newGame() {
    setState(() {
      count = 0;
      _guessNumber = null;
      _game = new Game();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GUESS THE NUMBER'),),
      body: Container(
        color: Colors.yellow.shade100,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeadder(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadder() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo_number.png',
          width: 240.0, // 160 = 1 inch
        ),
        Text(
          'GUESS THE NUMBER',
          style: GoogleFonts.kanit(fontSize: 22.0),
        ),
      ],
    );
  }

  TextStyle ggstyle = GoogleFonts.inconsolata(fontSize: 40.0); 

  Widget _buildMainContent() {
    return _guessNumber == null
        ? Column(
            children: [
              Text("I'm thinking of a number between 1 and 100.", style: ggstyle,textAlign: TextAlign.center,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Can you guess it ? ', style: ggstyle,textAlign: TextAlign.center,),
                Icon(Icons.favorite, color: Colors.red, size: 40.0)
              ],)
            ],
          )
        : Column(
            children: [
              Text(_guessNumber!, style: ggstyle,textAlign: TextAlign.center,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _feedback != 'CORRECT!' ? 
                  Icon(Icons.clear, color: Colors.red, size: 40.0):
                  Icon(Icons.check, color: Colors.green, size: 40.0),
                  Text(_feedback!, style: ggstyle,textAlign: TextAlign.center,),
                ],
              ),
              if (_feedback == 'CORRECT!')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        newGame();
                      },
                      child: Text('New Game', style: ggstyle,textAlign: TextAlign.center,)),
                )
            ],
          );
  }

  Widget _buildInputPanel() {
    return Card(
      color: Colors.teal[200],
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter the number hear',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 10.0),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => setState(() {
                _guessNumber = _controller.text;
                int? guess = int.tryParse(_guessNumber!);

                if (guess != null) {
                  var result = _game.doGuess(guess);
                  if (result == 0) {
                    _feedback = 'CORRECT!';
                    _showMaterialDialog();
                  } else if (result == 1) {
                    _feedback = 'TOO HIGH!';
                  } else {
                    _feedback = 'TOO LOW!';
                  }
                }
                _controller.clear();
              }),
              child: Text('GUESS'),
            ),
          ],
        ),
      ),
    );
  }

  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('GOOD JOB!'),
          content: Container(
            height: 100.0,
            child: Column(
              children: [
                Text('The answer is ${_game.answer}.'),
                Text('You have made ${_game.totalGuesses} guesses.\n'),
                Text(_game.getAnsList())
              ],
            ),
          ),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// TextField(
//   controller: <ตัวแปรที่เป็น TextEditingController>
//   keyboardType: TextInputType.number,
//   style: const TextStyle(
//     color: Colors.yellow,
//     fontSize: 24.0,
//     fontWeight: FontWeight.bold,
//   ),
//   cursorColor: Colors.yellow,
//   textAlign: TextAlign.center,
//   decoration: InputDecoration(
//     contentPadding: EdgeInsets.all(10.0),
//     isDense: true,
//     // กำหนดลักษณะเส้น border ของ TextField ในสถานะปกติ
//     enabledBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.white.withOpacity(0.5),
//       ),
//     ),
//     // กำหนดลักษณะเส้น border ของ TextField เมื่อได้รับโฟกัส
//     focusedBorder: const UnderlineInputBorder(
//       borderSide: BorderSide(color: Colors.white),
//     ),
//     hintText: 'Enter the number here',
//     hintStyle: TextStyle(
//       color: Colors.white.withOpacity(0.5),
//       fontSize: 16.0,
//     ),
//   ),
// )
