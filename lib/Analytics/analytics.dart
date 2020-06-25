import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mmapp/analytics/healthAtt.dart';
import 'package:mmapp/analytics/hrGraph.dart' ;

class Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {

  @override
  Widget build(BuildContext context) {

    Padding heading( String text)
    {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Text(text,
            style : TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(

            //color: Colors.greenAccent,
            child: Column(
              children: <Widget>[
                heading("Health Analytics"),
                Padding(

                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.lightBlue[200],
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightBlue[200],
                            blurRadius: 25.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              0.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      child: SimpleLineChart.withSampleData()),
                ),
                heading("Health Attributes"),
                HealthAtt(),
                RaisedButton(


                  child: Text("Health Checkup"),
                  onPressed: (){
                      setState(() {
                        print("Health Check up");
                      });}
                ),
                heading("Cardio Status"),
                Row(
                  children: <Widget>[
                    Container(
                      //color: Colors.green,
                        child: Image.network("https://media1.giphy.com/media/l6JC0IxMDIS4QrUxO5/giphy.gif" , width: 150 , height: 150,)//Image.asset("CG_Heart.gif" , width: 100, height: 100,),
                    ),
                 Container(
                   //color: Colors.green,
                   child: Column(

                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Text("pulse Rate: 75 b/m"),
                       Text(""),
                       Text("Bp : 120/80 (normal)"),
                     ],
                   ),
                 )



              ],
            ),

            ],
          ),
          ),
        ],
      ),
    );
  }
}
