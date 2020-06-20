import 'package:flutter/material.dart';
import 'package:mmapp/analytics/HealthAtt.dart';
import 'package:mmapp/analytics/hrGraph.dart' ;

class analytics extends StatefulWidget {
  @override
  _analyticsState createState() => _analyticsState();
}

class _analyticsState extends State<analytics> {

  @override
  Widget build(BuildContext context) {

    Padding Heading( String text)
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
                Heading("Health Analytics"),
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
                Heading("Health Attributes"),
                HealthAtt(),
                RaisedButton(


                  child: Text("Health Checkup"),
                  onPressed: (){
                      setState(() {
                        print("baasdfasd");
                      });}
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
