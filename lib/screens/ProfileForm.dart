import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stellaris/Homepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileForm extends StatelessWidget {
  final storage = new FlutterSecureStorage();
  String _username, _firstname, _lastname;

  final formKey = GlobalKey<FormState>();

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
                child: new TextFormField(
                  onSaved: (str) => _username = str,
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
                  key: formKey,
                  child: new TextFormField(
                    onSaved: (str) => _firstname = str,
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
                  key: formKey,
                  child: new TextFormField(
                    onSaved: (str) => _lastname = str,
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
                onPressed: () async {
                  new Future.delayed(
                      new Duration(seconds: 2),
                      () =>
                          storage.write(key: "authState", value: "true"));
                  await storage.write(key: 'username', value: '$_username');
                  await storage.write(key: 'firstname', value: '$_firstname');
                  await storage.write(key: 'lastname', value: '$_lastname');
                  register();
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    ));
  }

  void register() async {
    var url = "https://matrix.org/_matrix/client/r0/register";
    http.post(url, body:
     {"username": "$_username",
     "auth": {"type": "m.login.token"}
     }).then((response) {
       print("$response.statusCode");
       print("$response.body");
     });
  }
}
