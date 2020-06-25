import 'package:flutter/material.dart';

class Ttd extends StatefulWidget {
  @override
  _TtdState createState() => _TtdState();
}

class _TtdState extends State<Ttd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talk to a doctor"),
        backgroundColor: Color(0xFF0A2D5E),
      ),
      body: Container(
      child: Center(
        child: Text('You can talk to a doctor here.'),
      )
      ),
    );
  }
}