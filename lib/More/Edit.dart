import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Color(0xFF0A2D5E),
      ),
      body: Container(
      child: Center(
        child: Text('You can update your profile here.'),
      )
      ),
    );
  }
}