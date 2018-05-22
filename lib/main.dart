import 'package:flutter/material.dart';
import './screens/SignUp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './Homepage.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:image_picker/image_picker.dart';
import './screens/Page1.dart';
import './screens/Page2.dart';
import './screens/Page3.dart';
import './screens/Page4.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScopedModel<AppModel>(model: AppModel(),
      
      child: new HomePage()),
      routes: <String, WidgetBuilder> {
        "/Page1": (BuildContext context) => new First(),
        "/Page2": (BuildContext context) => new Second(),
        "/Page3": (BuildContext context) => new Third(),
        "/Page4": (BuildContext context) => new Four(),
      },
    );
  }
}

class AppModel extends Model {
  
}

