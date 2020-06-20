import 'package:flutter/material.dart';
import 'package:mmapp/Plan/precautions.dart';

class session extends StatefulWidget {
  final String time , npills , comment ;
  session(this.time , this.npills , this.comment) ;
  @override
  _sessionState createState() => _sessionState(this.time , this.npills , this.comment);
}

class _sessionState extends State<session> {
  final String time , npills , comment ;
  _sessionState(this.time , this.npills , this.comment);

  Color mycolor ;
  @override
  Widget build(BuildContext context) {
    return
      FlatButton(

        //color: Colors.lightGreen[300],
        color : mycolor,
        child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(this.time), //time
              Text("crosin Pain relief"),
              Text(this.npills),  //no of pills
              Text(this.comment) // comment

            ],
          ),
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(32.0)),
                  ) ,
                  title: Text("Morning:"),
                  content: Table(
                    children: [
                      TableRow(
                        children: [
                          TableCell(child: Text("Name :")),
                          TableCell(child: Text("Crosin Pain relief")),
                        ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child: Text("pills:")),
                            TableCell(child: Text("2")),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child: Text("comment:")),
                            TableCell(child: Text("before break fast")),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(child: Text("content :")),
                            TableCell(child: Text("this tablet helps in "
                                "reducing headache and body pains")),
                          ]
                      ),

                    ],
                  )
                );
              }
          );
          setState(() {
            mycolor = Colors.lightGreen[300];
          });
        },
        );

  }
}

class plan extends StatefulWidget {
  @override
  _planState createState() => _planState();
}

class _planState extends State<plan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(20),
            width: 317,
            height :200,
            child:new Container(

              child: new GridView.count(

                crossAxisCount: 3,
                childAspectRatio: (1/ 3),
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  session("8:00 AM","2 pills" ,"after break fast"),
                  session("12:30 PM","1 pills" ,"After lunch"),
                  session("9:10 PM","1 pills" ,"before sleep"),
                ],
              ),
            ),
          ),
        precautions(),
        precautions()
      ],
    );
  }
}


