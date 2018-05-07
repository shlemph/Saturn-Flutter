import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';
import 'package:http/http.dart' as http;

class Third extends StatelessWidget {
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await getMessage(),
      renderLoad: () => new CircularProgressIndicator(),
      renderError: ([error]) =>
          new Text('Sorry, there was an error loading your joke'),
      renderSuccess: ({data}) => new Text(data),
    );
    return new Container(
      child: new Center(
        child: _asyncLoader,
      ),
    );
  }
}


getMessage() async {
  String pk = 'GBHLPXLJ4YR5UBDM75YYCHY4PWZWITIGPFAH7ENEY5DPMU5W6YB7M52C';
  final response =
  await http.get('https://horizon-testnet.stellar.org/accounts/$pk/transactions');
  final responseJson = json.decode(response.body);
  return new Future( () => responseJson.toString());
}
