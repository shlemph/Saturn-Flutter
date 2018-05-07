import 'package:flutter/material.dart';
import 'ProfileForm.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Text("Crypto For Everyone",
                    style: new TextStyle(fontSize: 24.0)),
              ),
              new Material(
                elevation: 7.0,
                borderRadius: new BorderRadius.circular(50.0),
                child: new MaterialButton(
                  child: new Text(
                    "Create Identity",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepPurpleAccent,
                  splashColor: Colors.deepPurple,
                  minWidth: 200.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new ProfileForm()),
                    );
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Material(
                  borderRadius: new BorderRadius.circular(50.0),
                  child: new FlatButton(
                    color: Colors.transparent,
                    onPressed: () {},
                    child: new Text("Use Existing Identity"),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  final shadowColor = Colors.black87;
}
