import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
