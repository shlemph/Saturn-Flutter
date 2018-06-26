import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class AppModel extends Model {
  final storage = new FlutterSecureStorage();

  String name;

  void setName(String string) async {
    name = string;
    notifyListeners();
  }
}

class AndroidModel extends Model {
  static const platformMethodChannel = const MethodChannel('com.test/test');

  String messages;

  Future<String> nativeAndroidCall() async {
    String value;

    try {
      value = await platformMethodChannel.invokeMethod('getMessage');
    } catch (e) {
      print(e);
    }
    print(value);
    return value;
  }
}
