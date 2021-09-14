import 'dart:html';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  Widget _buildMainContent() {
    return _guessNumber == null ? SizedBox.shrink() : Column(
      children: [
        Text(_guessNumber!),
        Text(_feedback!),
      ],
    );
  }

  Widget _buildInputPanel() {
    return Card(
      color: Colors.teal[100],
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
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
                  } else if (result == 1) {
                    _feedback = 'TOO HIGH!';
                  } else {
                    _feedback = 'TOO LOW';
                  }
                }
              }),
              child: Text('GUESS'),
            ),
          ],
        ),
      ),
    );
  }
}
