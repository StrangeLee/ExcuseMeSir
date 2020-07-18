import 'package:flutter/material.dart';
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
        children: [
          TextField(
            controller: _speakController,
            maxLength: 20,
          ),
          FlatButton(
            onPressed: () => _speak(),
            child: Text('sound'),
          ),
        ],
      ),
    );
  }

  Future _speak() async {
    await _flutterTts.setLanguage('ko-KR');
    await _flutterTts.setSpeechRate(1);
    await _flutterTts.speak(_speakController.text);
  }
}
