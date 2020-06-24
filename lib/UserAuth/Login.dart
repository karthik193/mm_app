import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mmapp/Database/users.dart';
import 'package:mmapp/Main/structure.dart';
import 'package:mmapp/Plan/plan.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email , _password ;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 335 ,
      height : 200,

      decoration: BoxDecoration(
        //border: Border.all(color: Colors.blue),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),

      ),
      child: Form(
        key : _formKey ,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return'Please enter the email' ;
                }

              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                labelText: 'Email' ,
              ),
            ) ,

            //TODO: for password
            TextFormField(
              validator: (input){
                if(input.length < 6 ){
                  return'password should be atleast 6 chars' ;
                }

              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                labelText: 'Password' ,
              ),
              obscureText: true,
            ) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Sign in"),
                  onPressed: signIn,
                  color: Color(0xFF0A2D5E),
                  textColor: Colors.white,
                ),
                RaisedButton(
                  child: Text("Sign Up"),
                  onPressed: signUp,
                  color: Color(0xFF0A2D5E),
                  textColor: Colors.white,
                ),
              ],
            )

            //TODO: complete the form
          ],
        ),
      ),
    );

  }
  Future<void> signIn() async {
    final _form = _formKey.currentState ;
    if(_form.validate())
    {
      //TODO: login to fire Base
      //TODO: create an app in a project and then goto Authentication bar
      //TODO: chooose the type of authentication

      _form.save() ;
      try{
        FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user ;
        loadUserData(user.uid) ;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Structure())) ;
      }
      catch(e)
      {
        print(e) ;
      }

    }
  }

  Future signUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Structure())) ;

  }
}
