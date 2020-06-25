import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery"),
        backgroundColor: Color(0xFF0A2D5E),
      ),
      body: Container(
      child: Center(
        child: Text('You can request for home delivery of medicines here.'),
      )
      ),
    );
  }
}