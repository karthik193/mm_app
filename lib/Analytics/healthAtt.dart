import 'package:flutter/material.dart';
class HealthAtt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final TextStyle _forTableatts = TextStyle(
      fontWeight: FontWeight.bold ,
      fontFamily: "Bahnschrift",
      fontSize: 15
    );
    final TextStyle _forTablevals = TextStyle(

        fontFamily: "Bahnschrift",
        fontSize: 15,
    );
    return Container(
        child: DataTable(
          columns: [

            DataColumn(label: Text('Attribute',style: _forTableatts,)),
            DataColumn(label: Text('Value', style: _forTableatts,)),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(Text("Health Rate", style: _forTableatts,)),
                DataCell(Text("83%" , style: _forTablevals)),
              ]
            ),
            DataRow(
                cells: [
                  DataCell(Text("Recovery", style: _forTableatts,)),
                  DataCell(Text("4%" , style: _forTablevals)),
                ]
            ),
            DataRow(
                cells: [
                  DataCell(Text("Recommended Excersices", style: _forTableatts,)),
                  DataCell(Text("push ups and Squads" , style: _forTablevals)),
                ]
            ),
            DataRow(
                cells: [
                  DataCell(Text("doctor Recommended", style: _forTableatts,)),
                  DataCell(Text("No" , style: _forTablevals)),
                ]
            ),


          ],
        ),
    );
  }
}
