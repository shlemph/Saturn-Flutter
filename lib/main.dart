import 'dart:async';
import 'package:flutter/material.dart';
import './screens/SignUp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './Homepage.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:image_picker/image_picker.dart';
import './screens/UserProfile.dart';
import './screens/ProfileForm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './AppModel.dart';
import './screens/WalletScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return new ScopedModel<AppModel>(
      model: new AppModel(),
          child: new MaterialApp(

        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        home: new SplashPage(),
        routes: <String, WidgetBuilder>{
          "/HomePage": (BuildContext context) => new HomePage(),
          "/SignUp": (BuildContext context) => new SignUp(),
          "/ProfileForm": (BuildContext context) => ProfileForm(),
          "/UserProfile": (BuildContext context) => new UserProfile(),
          "/WalletScreen": (BuildContext context) => new Wallet(),
        },
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authState = (prefs.getBool('authState'));
    if (authState != true) {
      Navigator.of(context).pushReplacementNamed('/SignUp');
    } else {
      Navigator.of(context).pushReplacementNamed('/HomePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            children: <Widget>[
              new Text("SATURN"),
              new CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
