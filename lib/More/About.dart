import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Color(0xFF0A2D5E),
      ),
      body: Container(
      child: Center(
        child: Text('This is a medical management app.'),
      )
      ),
    );
  }
}