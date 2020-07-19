import 'package:excuse_me_sir_project/display_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FlutterTts _flutterTts = FlutterTts();
  TextEditingController _speakController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'tts test'
        ),
      ),
      body: _body(),
    );
  }
  
  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextField(
              controller: _speakController,
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(
                color: Colors.blue,
                width: 2.0,
              )
            ),
            onPressed: () => _speak(),
            child: Text('sound'),
            color: Colors.lightBlue[100],
          ),
        ],
      ),
    );
  }

  // ko-KR = 한국어, en_US 영어
  Future _speak() async {
    await _flutterTts.setLanguage('en_US');
    await _flutterTts.setSpeechRate(1);
//    await _flutterTts.setVolume(100.0);
    await _flutterTts.speak(_speakController.text);

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DisplayPage(
        message: _speakController.text,
      ),
    ));
  }
}
