import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DisplayPage extends StatefulWidget {
  final String message;

  const DisplayPage({Key key, this.message}) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState(message);
}

class _DisplayPageState extends State<DisplayPage> {
  String message;

  _DisplayPageState(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
