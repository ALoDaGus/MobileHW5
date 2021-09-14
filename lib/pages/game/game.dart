import 'dart:math';

class Game {
  final int _answer;
  int _totalGuesses = 0;
  List<int> _guessList = [];

  Game() : _answer = Random().nextInt(100) + 1 {
    print('The answer is $_answer');
  }

  String getAnsList() {
    String str = _guessList.toString();
    str = str.replaceAll('[', '');
    str = str.replaceAll(']', '');
    str = str.replaceAll(',', ' ->');

    return str;
  }

  int get totalGuesses {
    return _totalGuesses;
  }

  int get answer {
    return _answer;
  }

  int doGuess(int num) {
    _totalGuesses++;
    _guessList.add(num);

    if (num > _answer) {
      return 1;
    } else if (num < _answer) {
      return -1;
    } else {
      return 0;
    }
  }
}
