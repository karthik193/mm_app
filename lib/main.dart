import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mmapp/analytics/analytics.dart';
import 'package:mmapp/my_flutter_app_icons.dart';
import  'my_flutter_app_icons.dart' ;
import 'Plan/plan.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : "MM app",
      theme: ThemeData(fontFamily: 'Mont'),
      home: myNav(),
    );
  }
}

class myNav extends StatefulWidget {
  @override
  _myNavState createState() => _myNavState();
}

class _myNavState extends State<myNav> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold  );
  static  List<Widget> _widgetOptions = <Widget>[
    plan(),
    //Text("Health analytics" , style: optionStyle,),
    analytics() ,
    Text("Search" , style: optionStyle,),
    Text("Profile" , style: optionStyle,),

  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stimuLife" , style: TextStyle(
          fontFamily: 'Mont',
        ),),
        backgroundColor: Color(0xff0A2D5E),
      ),
      body: SingleChildScrollView(
        child : _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.done),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.account_circle),
            title: Text(''),

          )

        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,

      ),
    );
  }
}

