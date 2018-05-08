import 'package:flutter/material.dart';
import './screens/SignUp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:image_picker/image_picker.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SignUp(),
    );
  }
}
