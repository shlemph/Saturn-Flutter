import 'package:flutter/material.dart';
import 'package:flutter_fetch_widget/flutter_fetch_widget.dart';
import 'dart:convert' as convert;
import "package:http/http.dart" as http;

class FetchBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FetchWidget<Balance>(
      url:
          "https://horizon-testnet.stellar.org/accounts/GBHLPXLJ4YR5UBDM75YYCHY4PWZWITIGPFAH7ENEY5DPMU5W6YB7M52C",
      transform: _toPost,
      builder: (fetchPost) {
        if (fetchPost.isWaiting) {
          return new Text("Loading...");
        }
        if (fetchPost.isDone && fetchPost.statusCode != 200) {
          return new Text(
              'Could not connect to API service. `${fetchPost.response.body}`');
        }
        return new Column(
          children: <Widget>[
            new Text("   ${fetchPost.data.balance}",
                style: TextStyle(fontSize: 32.0, color: Colors.white)),
            new Text(
              ' XLM',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ],
        );
      },
    );
  }
}

Balance _toPost(response) {
  final Map<String, dynamic> json = convert.json.decode(response.body);
  final bal = json['balances'];
  for (var items in bal) {
    Map myMap = items;
    print(myMap['balance']);
    return new Balance(myMap['balance']);
  }
}

class Balance {
  final balance;
  Balance(this.balance);
}
