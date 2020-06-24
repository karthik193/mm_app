import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mmapp/Database/users.dart';
import '../main.dart';
import 'package:mmapp/UserAuth/Login.dart';
import 'package:mmapp/analytics/analytics.dart';
import '../Plan/plan.dart';
import '../Search/searchpage.dart';
import '../Profile/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class Structure extends StatefulWidget {
  Structure({Key key}) : super(key: key);

  @override
  _StructureState createState() => _StructureState();
}

class _StructureState extends State<Structure> {
  int bottomSelectedIndex = 0;


  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.check),
          backgroundColor: Color(0xFF0A2D5E),
          title: Text('')),
      BottomNavigationBarItem(
          icon: Icon(Icons.equalizer),
          backgroundColor: Color(0xFF0A2D5E),
          title: Text('')),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text(''),
        backgroundColor: Color(0xFF0A2D5E),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
          backgroundColor: Color(0xFF0A2D5E),
          title: Text('')),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {

    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Plan(),
        Analytics(),
        SearchPage(),
        AppBody() ,
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.panorama_fish_eye),
        title: Text("stimuLife"),
        actions: <Widget>[
          // action button
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyMenu()),
                );
              }),
        ],
        backgroundColor: Color(0xFF0A2D5E),
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        selectedItemColor: Colors.grey,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}




class MyMenu extends StatefulWidget {
  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More Options"),
        backgroundColor: Color(0xFF0A2D5E),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(title: Text("Edit Profile"), onTap: () {}),
            ListTile(title: Text("Request Home Delivery"), onTap: () {}),
            ListTile(title: Text("Schemes"), onTap: () {}),
            ListTile(title: Text("Talk to a Doctor"), onTap: () {}),
            ListTile(title: Text("About"), onTap: () {}),
            ListTile(title: Text("Logout"), onTap: () {
              FirebaseAuth.instance.signOut() ;
              Navigator.push(context, MaterialPageRoute(builder:(context) => MyApp())) ;
            }),
          ]).toList(),
        ),
      ),
    );
  }
}











