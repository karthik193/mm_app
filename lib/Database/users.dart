import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference _users = Firestore.instance.collection('users') ;
var _data  ;

Future loadUserData(String uid) async
{
    _data = _users.document(uid);
}
Future createNewUser(var newUserData , var uid)
{
    var _newSet  = Firestore.instance.document("users/" + uid) ;
    _newSet.setData(newUserData) ;
    _data = _newSet ;

}
StreamBuilder getUserName ()
{
    print(_data) ;
    return StreamBuilder(
        stream : _data.snapshots(),
        builder: (context , snapshot){
            print(snapshot.data['name']) ;
            return Text(snapshot.data['name']) ;
        },
    ) ;

}




