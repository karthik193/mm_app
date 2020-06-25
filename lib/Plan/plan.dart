import 'package:flutter/material.dart';
import 'package:mmapp/Plan/precautions.dart';

class Session extends StatefulWidget {
  final String time , npills , comment ;
  Session(this.time , this.npills , this.comment) ;
  @override
  _SessionState createState() => _SessionState(this.time , this.npills , this.comment);
}

class _SessionState extends State<Session> {
  final String time , npills , comment ;
  _SessionState(this.time , this.npills , this.comment);

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

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return ListView(
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Center(
             child: Text("Medication Plan :",
                 style : TextStyle(
                   fontWeight: FontWeight.bold ,
                   fontSize: 20,
                 )
             ),
           ),
         ),
        Center(child: Text("(tap on below tabs)")),
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

                  Session("8:00 AM","2 pills" ,"after break fast"),
                  Session("12:30 PM","1 pills" ,"After lunch"),
                  Session("9:10 PM","1 pills" ,"before sleep"),
                ],
              ),
            ),
          ),
        Precautions(),
      ],
    
    );
  }
}


