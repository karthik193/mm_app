import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Precautions extends StatelessWidget {
  final TextStyle _forTableatts = TextStyle(
      fontWeight: FontWeight.bold ,
      fontFamily: "Bahnschrift",
      fontSize: 15
  );
  final TextStyle _forTablevals = TextStyle(

    fontFamily: "Bahnschrift",
    fontSize: 15,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Activity Zone :",
            style : TextStyle(
              fontWeight: FontWeight.bold ,
              fontSize: 20,
            )
            ),
          ),
         Table(
           children: [
             TableRow(
               children: [
                 TableCell(child: Center(child: Text('Food Precautions', style: _forTableatts,)),),
                 TableCell(child: Center(child: Text('Avoid taking Oil Food , junk food like bugers, pizzas etc.\n'
                     'Try consuming more liquids.\n'
                     'maintain a Good diet.', style: _forTablevals,)),),
               ]
             ),
             TableRow(
                 children: [
                   TableCell(child: Center(child: Text('Body Precautions', style: _forTableatts,)),),
                   TableCell(child: Center(child: Text("Sleep before 10:00 AM\n"
                       "try to have a good sleep for Atleast 6hrs a day.", style: _forTablevals,)),),
                 ]
             ),
             TableRow(
                 children: [
                   TableCell(child: Center(child: Text('hygiene', style: _forTableatts,)),),
                   TableCell(child: Center(child: Text('Make your Surroundings Clean.\n'
                       'wash your bed sheet atleast Once in a week.', style: _forTablevals,)),),
                 ]
             )
           ],
         )
        ],
      ),
    );
  }
}
