import 'package:flutter/material.dart';
import 'package:mmapp/Database/users.dart';

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  BoxDecoration bd = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 12.0, // soften the shadow
        spreadRadius: 3.0, //extend the shadow
        offset: Offset(
          5.0, // Move to right 10  horizontally
          5.0, // Move to bottom 10 Vertically
        ),
      )
    ],
    borderRadius:new BorderRadius.all(new Radius.circular(20.0)),
  ) ;

  BoxDecoration preHospitals =  BoxDecoration(
    color: Colors.grey[200],
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 10.0, // soften the shadow
        spreadRadius: 2.0, //extend the shadow
        offset: Offset(
          0.0, // Move to right 10  horizontally
          0.0, // Move to bottom 10 Vertically
        ),
      )
    ],
    borderRadius:new BorderRadius.all(new Radius.circular(20.0)),

  );
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
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new  NetworkImage("https://scontent-bom1-1.cdninstagram.com/v/t51.2885-19/s150x150/100958681_249556352965333_8495728044890128384_n.jpg?_nc_ht=scontent-bom1-1.cdninstagram.com&_nc_ohc=m7gyGYYu08YAX_sX0Ba&oh=ac63e5e454e2f7bef83097305438fc37&oe=5F1D6986"),
                            //new NetworkImage(
                                //"https://cdn.pixabay.com/photo/2016/03/26/20/35/young-man-1281282__340.jpg")
                          )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Name :"),
                          getUserName(),
                        ],
                      ),
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
            //color: Color(0xFFF6F6F6),
            decoration: bd,
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
            //color: Color(0xFFF6F6F6),
            decoration: preHospitals,
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
            //color: Color(0xFFF6F6F6),
            decoration: preHospitals,
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
            //color: Color(0xFFF6F6F6),
            decoration: preHospitals,
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