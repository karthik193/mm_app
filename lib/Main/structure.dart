import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mmapp/Database/users.dart';
import 'package:mmapp/More/About.dart';
import 'package:mmapp/More/Delivery.dart';
import 'package:mmapp/More/Edit.dart';
import 'package:mmapp/More/Schemes.dart';
import 'package:mmapp/More/TTD.dart';
import '../main.dart';
import 'package:mmapp/UserAuth/Login.dart';
import 'package:mmapp/analytics/analytics.dart';
import '../Plan/plan.dart';
import '../Search/searchpage.dart';
import '../Profile/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// ignore: must_be_immutable
class Structure extends StatefulWidget {
  int id;
  Structure({Key key, this.id}) : super(key: key);

  @override
  _StructureState createState() {
    return _StructureState(id);
  }
}

class _StructureState extends State<Structure> {
  int bottomSelectedIndex;

  _StructureState(this.bottomSelectedIndex) {}
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
        AppBody(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (bottomSelectedIndex != 0) {
        bottomTapped(bottomSelectedIndex);
      }
    });
  }

  Future<void> changeID() async {
    await setState(() {
      pageController.animateToPage(bottomSelectedIndex,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
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
            ListTile(
                title: Text("Edit Profile"),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Edit()));
                }),
            ListTile(
                title: Text("Request Home Delivery"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delivery()));
                }),
            ListTile(
                title: Text("Schemes"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Schemes()));
                }),
            ListTile(
                title: Text("Talk to a Doctor"),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ttd()));
                }),
            ListTile(
                title: Text("About"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                }),
            ListTile(
                title: Text("Logout"),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                }),
          ]).toList(),
        ),
      ),
    );
  }
}
