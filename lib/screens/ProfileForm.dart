
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:scoped_model/scoped_model.dart';
import '../AppModel.dart';



class ProfileForm extends StatelessWidget {
  final formKey = new GlobalKey<FormState>();
  
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<AppModel>(
      builder: (context, child, model) =>
         new Scaffold(
           resizeToAvoidBottomPadding: false,
          body: new Center(
        child: new Container(
          child: new Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Sign Up", style: new TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold
                ),),
                new Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: new Text("Please Fill out the Form to complete Sign Up", style: new TextStyle(
                    fontSize: 12.0,
                  ),),
                ),
                new Form(
                  key: formKey,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        onSaved: (val) =>  val,
                        initialValue: null,
                        decoration: new InputDecoration(
                            labelText: 'User Name',
                            contentPadding: new EdgeInsets.all(12.0),
                             ),
                      ),
                      new TextFormField(
                        onSaved: (val) => model.setName(val),
                        initialValue: null,
                        decoration: new InputDecoration(
                            labelText: 'First Name',
                            contentPadding: new EdgeInsets.all(12.0),
                            ),
                      ),
                      new TextFormField(
                        onSaved: (val) =>  val, 
                        initialValue: null,
                        decoration: new InputDecoration(
                          labelText: 'Last Name',
                          contentPadding: new EdgeInsets.all(12.0),
                          
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new MaterialButton(
                    color: Colors.deepPurple,
                    elevation: 5.0,
                    child: Text("Submit", style: new TextStyle(color: Colors.white),),
                    onPressed: () {
                      submit();
                      Navigator.of(context).pushReplacementNamed('/HomePage');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  // Sets AuthState to true and Registers User
  void submit() async {
    final form = formKey.currentState;
      form.save();
  }
}