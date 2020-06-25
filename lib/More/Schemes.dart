import 'package:flutter/material.dart';

class Schemes extends StatefulWidget {
  @override
  _SchemesState createState() => _SchemesState();
}

class _SchemesState extends State<Schemes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schemes"),
        backgroundColor: Color(0xFF0A2D5E),
      ),
      body: Container(
      child: Center(
        child: Text('You can view all available medical schemes here.'),
      )
      ),
    );
  }
}