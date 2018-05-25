import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert' as convert;
import 'package:flutter_fetch_widget/flutter_fetch_widget.dart';


class Four extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new BottomAppBar(
        hasNotch: true,
        color: new Color(0xFF6200ea),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BackButton(
              color: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => {},
          elevation: 5.0,
          notchMargin: 7.0,
          highlightElevation: 1.0,
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
      ), floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: new Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
          child: new Material(
            borderRadius: new BorderRadius.circular(10.0),
            child: new Container(
              color: Colors.white,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    new Material(
                      borderRadius: new BorderRadius.circular(100.0),
                      elevation: 5.0,
                        child: new CachedNetworkImage(
                          imageUrl: "https://avatars.io/instagram/a.i.d.x.n",
                      ),
                    ),
                  ]),
                  new FetchWidget<Post>(
                    url: "https://horizon-testnet.stellar.org/accounts/GBHLPXLJ4YR5UBDM75YYCHY4PWZWITIGPFAH7ENEY5DPMU5W6YB7M52C",
                    transform: _toPost,
                    builder: (fetchPost) {
                      if (fetchPost.isWaiting) {
                        return new Text("Loading...");
                      }
                      if (fetchPost.isDone && fetchPost.statusCode != 200) {
                        return new Text(
                          'Could not connect to API service. `${fetchPost.response.body}`'
                        );
                      }
                      return new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Text('Balance', style: TextStyle(fontSize: 18.0, color: Color(0xFF6200ea)),),
                              new Text("   ${fetchPost.data.id}",  style: TextStyle(fontSize: 32.0)),
                              new Text(' XLM', style: TextStyle(fontSize: 18.0),)
                            ],
                          ),
                          new RaisedButton(
                            onPressed: () => fetchPost.doFetch(),
                            child: new Text("refresh"),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Post _toPost(response) {
  final Map<String, dynamic> json = convert.json.decode(response.body);
  final bal = json['balances'];
  for (var items in bal) {
    Map myMap = items;
    print(myMap['balance']);
    return new Post(myMap['balance']);
  }
}

class Post {
  final id;
  Post(this.id);
}
