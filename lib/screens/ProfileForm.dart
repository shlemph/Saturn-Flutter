import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:stellaris/Homepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class ProfileForm extends StatefulWidget {
  @override
  ProfileFormState createState() => new ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  final textController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    textController.addListener(listener);
  }

  listener() {
    print("${textController.text}");
  }

  authState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authState = (prefs.getBool('authState'));
    await prefs.setBool('authState', true);
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
                child: new TextFormField(
                  controller: textController,
                  onSaved: (text) async =>
                      await storage.write(key: "userName", value: text),
                  initialValue: null,
                  decoration: new InputDecoration(
                      labelText: 'User Name',
                      contentPadding: new EdgeInsets.all(12.0),
                      border: InputBorder.none),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Form(
                  child: new TextFormField(
                    controller: textController,
                    onSaved: (text) async =>
                        await storage.write(key: "firstName", value: text),
                    initialValue: null,
                    decoration: new InputDecoration(
                        labelText: 'First Name',
                        contentPadding: new EdgeInsets.all(12.0),
                        border: InputBorder.none),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Form(
                  child: new TextFormField(
                    controller: textController,
                    onSaved: (text) async =>
                        await storage.write(key: "lastName", value: text),
                    initialValue: null,
                    decoration: new InputDecoration(
                      labelText: 'Last Name',
                      contentPadding: new EdgeInsets.all(12.0),
                      border: InputBorder.none,
                    ),
                  ),
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

  void submit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('authState', true);
    print("User Signed In");
  }
}
