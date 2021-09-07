import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String currentFont = 'Prompt';
  List<String> fontName = ['Prompt', 'Kanit', 'Taviraj', 'Sriracha', 'Pridi', 'Mali', 'Itim', 'Charm', 'Pattaya', 'Chonburi'];

  Widget _button(font) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
        onPressed: () {
          setState(() => currentFont = font);
        },
        child: Text(
          font,
          style: GoogleFonts.getFont(font),
        )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('THAI FONT VIEWER')),
      body: Container(
        color: Colors.teal[100],
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text(
                      'การเดินทางของฉันและเธอคือการเรียนรู้ การเรียนรู้ของเราสองคนคือความเข้าใจ ~',
                      style: GoogleFonts.getFont(currentFont, fontSize: 50.0),
                    ),
                  ),
                ),
              ),
              Text('Font ' + currentFont, style: GoogleFonts.getFont(currentFont),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.teal[50],
                  elevation: 5.0,
                  child: Wrap(
                      alignment: WrapAlignment.center,
                    children: fontName.map((e) => _button(e)).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
