import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';
import 'package:http/http.dart' as http;


class First extends StatelessWidget {
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
      renderSuccess: ({data}) => new Text(
            data,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[600],
                fontSize: 24.0),
          ),
    );

    return new Scaffold(
      body: new Center(
        child: new Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 75.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  "My Wallet",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 50.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 10.0,
                    child: new Container(
                      color: Colors.white,
                      child: new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Text(
                                  "Balance",
                                  style: new TextStyle(
                                      color: Colors.deepPurple[600],
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                            _asyncLoader
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                new FlatButton(
                  onPressed: () => Navigator.of(context).pushNamed("/Page2"),
                  child: Text(
                    "Press"
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List textBal;

getMessage() async {
  String pk = 'GBHLPXLJ4YR5UBDM75YYCHY4PWZWITIGPFAH7ENEY5DPMU5W6YB7M52C';
  final response =
      await http.get(Uri.encodeFull('https://horizon-testnet.stellar.org/accounts/$pk'),
      headers: {"Accept": "application/json"});
  final Map responseJson = json.decode(response.body);
  List textBal = responseJson['balances'];
  return new Future(() => responseJson['balances'].toString());
}
