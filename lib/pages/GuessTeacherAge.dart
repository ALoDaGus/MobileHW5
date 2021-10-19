import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:hw04/service/api.dart';

class GuessTeacherAge extends StatefulWidget {
  const GuessTeacherAge({Key? key}) : super(key: key);

  static const routeName = "/guessTeacherAge";

  @override
  _GuessTeacherAgeState createState() => _GuessTeacherAgeState();
}

class _GuessTeacherAgeState extends State<GuessTeacherAge> {
  int year = 1;
  int month = 1;
  bool correct = false;
  bool _isloading = false;

  void _showMaterialDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
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

  _guess() async {
    setState(() => _isloading = true);
    var data = (await Api().submit('guess_teacher_age', {'year': year,'month':month})) as Map<String, dynamic>;

    if(data == null){
    setState(() => _isloading = false);
      return;
    }

      String text = data['text'];
      bool value = data['value'];

      if(value)
      setState(() {
        correct = true;
      });
      else{
        _showMaterialDialog('ผลการทาย', text);
      }
    setState(() => _isloading = false);
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess Teacher Age"),
      ),
      body:Stack(
        children: [
          correct ? correctBox() : guessBox(),
          if(_isloading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            )
        ],
      ),
    );
  }

  Container correctBox() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('อายุของอาจารย์', style: TextStyle(fontSize: 50.0)),
            Text('$year ปี $month เดือน',  style: TextStyle(fontSize: 40.0)),
            Icon(Icons.check, color:Colors.green, size: 100.0,),

          ],
        ),
      ),
    );
  }

  Container guessBox() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("อายุอาจารย์"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                border: Border.all(width: 3.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text('ปี'),
                  SpinBox(
                    min: 0,
                    max: 100,
                    value: 0,
                    onChanged: (value) => setState(() {
                      year = value as int;
                    }),
                  ),
                  Text('เดือน'),
                  SpinBox(
                    min: 0,
                    max: 11,
                    value: 0,
                    onChanged: (value) => setState(() {
                      month = value as int;
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _guess,
                      child: Text(
                        'ทาย',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
