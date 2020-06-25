import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mmapp/Database/users.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Sign Up"),
          backgroundColor: Color(0xFF0A2D5E),
        ),
        body: SingleChildScrollView(child: PageBody()),
      ),
    );
  }
}
class PageBody extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>() ;
  var userData  = {
    "name" :  " " ,
    "dob" : ""  ,
    "address" : "",
    "area" : "",
    "email" : " " ,
    "height" : 0 ,
    "weight": 0  ,
    "password" : "",
    "pincode" : " ",
    "state" : "",
    "mobile" :  "",


  } ;
  TextStyle labelStyle  = TextStyle(
    fontSize: 20 ,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300 ,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Text("Aadhar Number" , style: labelStyle,) ,
              //TODO:Name
              TextFormField(
                // ignore: missing_return
                validator: (input){
                  if(input.isEmpty){
                    return "Name required" ;
                  }

                },
                onSaved: (input){
                  userData["name"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Name' ,
                ),
              ) ,
              //TODO:dob
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return "Dob required" ;
                  }

                },
                onSaved: (input){
                  userData["dob"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Dob (dd/mm/yyyy)' ,
                ),
              ) ,
              //
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return "Aadhar number required" ;
                  }
                  else if (input.length < 5 )
                    {
                      return "incorrect Aadhar Number" ;
                    }
                },
                onSaved: (input){
                  userData["Aadhar"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Aadhar Number' ,
                ),
              ) ,

              //TODO:mobile Number
              //Text("Mobile Number" , style: labelStyle,) ,
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return "Mobile number required" ;
                  }
                  else if (input.length < 10 )
                  {
                    return "incorrect Phone Number" ;
                  }
                },
                onSaved: (input){
                  userData["mobile"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Mobile Number' ,
                ),
              ) ,
              //TODO:email
              //Text("Mobile Number" , style: labelStyle,) ,
              TextFormField(
                // ignore: missing_return
                validator: (input){
                  if(input.isEmpty){
                    return "emailrequired" ;
                  }
                  else if(!input.contains("@gmail.com"))
                    {
                      return "incorrect email id" ;
                    }
                },
                onSaved: (input){
                  userData["email"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Email ' ,
                ),
              ) ,
              //TODO:Password
              //Text("Mobile Number" , style: labelStyle,) ,
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return "Password required" ;
                  }
                  else if (input.length < 6 )
                  {
                    return "Password should be atleast 6 chars" ;
                  }
                },
                onSaved: (input){
                  userData["password"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Password' ,
                ),
              ) ,
              //TODO:height
              //Text("Mobile Number" , style: labelStyle,) ,
              TextFormField(
                onSaved: (input){
                  if(input.isNotEmpty)
                    userData["height"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Height' ,
                ),
              ) ,
              //TODO:weight
              TextFormField(
                onSaved: (input){
                  if(input.isNotEmpty)
                    userData["weight"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Weight' ,
                ),
              ) ,
              //TODO:address
              TextFormField(
                onSaved: (input){
                  if(input.isNotEmpty)
                    userData["address"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Address' ,
                ),
              ) ,
              //TODO:State
              TextFormField(
                onSaved: (input){
                  if(input.isNotEmpty)
                    userData["state"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'State' ,
                ),
              ) ,
              //TODO:Area
              TextFormField(
                onSaved: (input){
                  if(input.isNotEmpty)
                    userData["area"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Area' ,
                ),
              ) ,
              //TODO: pincode
              TextFormField(
                onSaved: (input){
                  if(input.isNotEmpty)
                    userData["pincode"]= input;
                },
                decoration: InputDecoration(
                  labelText: 'Pincode' ,
                ),
              ) ,

              RaisedButton(
                child: Text("Register"),
                textColor: Colors.white,
                color:  Color(0xFF0A2D5E),
                onPressed: Register,
              )

            ],

          ),
        ),
      ),
    );
  }
  Future Register() async{
    final _form = _formKey.currentState ;
    if(_form.validate())
    {
      _form.save() ;
      try{
        FirebaseUser user  = FirebaseAuth.instance.createUserWithEmailAndPassword(email: userData['email'], password: userData['password']) as FirebaseUser ;
        createNewUser(userData , user.uid) ;
        BuildContext context;
        Navigator.of(context).pop() ; 
      }
      catch(e)
      {
        print(e) ;
      }
    }
  }
}



