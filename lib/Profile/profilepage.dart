import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://cdn.pixabay.com/photo/2016/03/26/20/35/young-man-1281282__340.jpg"))),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Name: Virajith Kumar"),
                      Text("Age: 28"),
                      Text("CurOrg: KIMS Hospital"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 35,
              color: Color(0xFF009DF0),
              child: Center(
                child: Text("History"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 70,
            color: Color(0xFFF6F6F6),
            child: Center(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.fiber_manual_record, color: Colors.green),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text("KIMS Hospital"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 70,
            color: Color(0xFFF6F6F6),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Gandhi Hospital"),
                    Text("Reason: Not satisfied with..."),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 70,
            color: Color(0xFFF6F6F6),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Osmania Hospital"),
                    Text("Reason: Course completed..."),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 70,
            color: Color(0xFFF6F6F6),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("XYZ Hospital"),
                    Text("Reason: Treatment for ..."),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}