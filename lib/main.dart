import 'dart:async';

import 'package:flutter/material.dart';
import './screens/SignUp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './Homepage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:async_loader/async_loader.dart';
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
      showPerformanceOverlay: false,
      home: ScopedModel<AppModel>(model: AppModel(),
      
      child: new SplashPage()),
      routes: <String, WidgetBuilder> {
        "/Page1": (BuildContext context) => new First(),
        "/Page2": (BuildContext context) => new Second(),
        "/Page3": (BuildContext context) => new Third(),
        "/Page4": (BuildContext context) => new Four(),
      },
    );
  }
}

class SplashPage extends StatelessWidget {
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await _accessToken(),
            renderLoad: () => new CircularProgressIndicator(),
            renderError: ([error]) =>
                new SignUp(),
            renderSuccess: ({data}) => new HomePage(),
          );
          return _asyncLoader;
        }
      
      }

      final storage = new FlutterSecureStorage();
      
      _accessToken() async {
        String access_token = await storage.read(key: "access_token");
        const delay = const Duration(seconds:1);
        if (access_token = null) {
          return new Future.delayed(delay, () => new SignUp());
        } else {
          return new Future.delayed(delay, () => new HomePage());
        }
}




class AppModel extends Model {
  
}

