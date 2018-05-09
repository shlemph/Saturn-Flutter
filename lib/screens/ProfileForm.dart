import 'package:flutter/material.dart';
import 'package:stellaris/Homepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class ProfileForm extends StatelessWidget {
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
                  initialValue: null,
                  decoration: new InputDecoration(
                    labelText: 'User Name',
                    contentPadding: new EdgeInsets.all(12.0),
                    border: InputBorder.none
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Form(
                  child: new TextFormField(
                    initialValue: null,
                    decoration: new InputDecoration(
                      labelText: 'First Name',
                      contentPadding: new EdgeInsets.all(12.0),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Form(
                  child: new TextFormField(
                    initialValue: null,
                    decoration: new InputDecoration(
                      labelText: 'Last Name',
                      contentPadding: new EdgeInsets.all(12.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              new IconButton(
                icon: new Icon(Icons.check_circle),
                onPressed: () {
                  storage.write(key: 'name', value: 'Aidan');
                  Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              )
            ],
           ),
         ),
       ),
     )
    );
  }

}