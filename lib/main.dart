import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mmapp/UserAuth/Login.dart';
import 'package:mmapp/analytics/analytics.dart';
import 'Plan/plan.dart';
import 'Search/searchpage.dart';
import 'Profile/profilepage.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "stimuLife" ,
      theme: ThemeData(
        fontFamily: "Mont",
      ),
      home : UserLogin(),
    );
  }
}
class UserLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("login"),
      backgroundColor: Color(0xFF0A2D5E),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
//        Container(
//              //color: Colors.green,
//                child: Image.network("https://upload.wikimedia.org/wikipedia/commons/1/12/CG_Heart.gif" , width: 200 , height: 200,)//Image.asset("CG_Heart.gif" , width: 100, height: 100,),
//            ),
         Container(
           color: Colors.grey[200],
           padding: EdgeInsets.all(10.00),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Center(child: Text("help:", )) ,
               Text("1. Sign up Page in not Complete.you can sign in using below Credencials"),
               Text(""),
               Text("email : karthik.pasupulatei@gmail.com"),
               Text("password : mypass\n"),
               Text("2. To know how to use the app select the options Icon and Help.")
             ],

           ),
         ),
         Center(child: Login()) ,
        ],
      ),
    );
  }
}

