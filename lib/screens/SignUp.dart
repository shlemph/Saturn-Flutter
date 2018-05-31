import 'package:flutter/material.dart';
import 'ProfileForm.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/planet.png');
    var image = new  Image(image: assetsImage, width: 200.0, height: 200.0,);

    return new Scaffold(
      body: new Center(
          child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: image,
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 20.0,8.0,8.0),
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text("Get Started",
                    style: new TextStyle(fontSize: 24.0)),
              ),
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
      )),
    );
  }

  final shadowColor = Colors.black87;
}
