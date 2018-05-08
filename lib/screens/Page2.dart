import 'package:flutter/material.dart';
import 'package:flutter_sodium/flutter_sodium.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';

class Second extends StatelessWidget {
  get storage => new FlutterSecureStorage();
  
  Future read() async {
    String value = await storage.read(key: 'pk');
    print("value = $value");
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Text(read.toString()
      ),
    );
  }
}