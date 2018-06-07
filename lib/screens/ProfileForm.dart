import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:stellaris/Homepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class ProfileForm extends StatefulWidget {
  @override
  ProfileFormState createState() => new ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  final formKey = new GlobalKey<FormState>();

  String _userName;
  String _firstName;
  String _lastName;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
      child: new Container(
        child: new Padding(
          padding: const EdgeInsets.all(30.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Form(
                key: formKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      onSaved: (val) => _userName = val,
                      initialValue: null,
                      decoration: new InputDecoration(
                          labelText: 'User Name',
                          contentPadding: new EdgeInsets.all(12.0),
                          border: InputBorder.none),
                    ),
                    new TextFormField(
                      onSaved: (val) => _firstName = val,
                      initialValue: null,
                      decoration: new InputDecoration(
                          labelText: 'First Name',
                          contentPadding: new EdgeInsets.all(12.0),
                          border: InputBorder.none),
                    ),
                    new TextFormField(
                      onSaved: (val) => _lastName = val, 
                      initialValue: null,
                      decoration: new InputDecoration(
                        labelText: 'Last Name',
                        contentPadding: new EdgeInsets.all(12.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              new MaterialButton(
                child: Text("Done"),
                onPressed: () {
                  submit();
                  Navigator.of(context).pushReplacementNamed('/HomePage');
                },
              )
            ],
          ),
        ),
      ),
    ));
  }

  // Sets AuthState to true and Registers User
  void submit() async {
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      performLogin();
      saveInfo();
    }
  }

  void performLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storage = new FlutterSecureStorage();
    Dio dio = new Dio();
    var url = "https://matrix.org/_matrix/client/r0/register";
    Response response = await dio.post(url, data: {"username": "$_userName", "auth": {"type":"m.login.token"}});    
    final json = convert.json.decode(response.data);
    String access_token = json['access_token'];
    prefs.setString("access_token", access_token);
    storage.write(key: "access_token", value: "$access_token");
    await prefs.setBool('authState', true);
    print("User Signed In" + "${response.data}");
  }

  void saveInfo() {
    final storage = new FlutterSecureStorage();
    storage.write(key: "userName", value: "$_userName");
    storage.write(key: "firstName", value: "$_firstName");
    storage.write(key: "lastName", value: "$_lastName");
  }
