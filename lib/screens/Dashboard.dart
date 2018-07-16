//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 8.0, 0.0, 0.0),
                      child: new Text(
          'Your Dapps',
          style: new TextStyle(
              fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 18.0 ),
        ),
                    ),
          ],
        ),
        new Container(
          margin: EdgeInsets.symmetric(vertical: 0.0),
          height: 110.0,
          child: new SizedBox(
            height: 100.0,
            child: new CarouselSlider(
                items: [
                  new AppWidget(
                    appName: 'Saturn Messaging',
                    image: new Image.asset(
                      'assets/logo.jpeg',
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                  new AppWidget(
                    appName: 'Ipfs',
                    image: Image.asset(
                      'assets/ipfs.png',
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                  new AppWidget(
                    appName: 'FileCoin',
                     image: new Image.asset('assets/filecoin.png',),
                  ),
                ].map((i) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new Container(
                          width: MediaQuery.of(context).size.width,
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              new BoxShadow(
                                 color: const Color(0xFFdbd6ff),
                                 offset: Offset(0.0, 2.0),
                                 blurRadius: 7.0,
                                 spreadRadius: 0.0
                              )
                            ]
                          ),
                          child: i);
                    },
                  );
                }).toList(),
                height: 100.0,
                viewportFraction: 0.7,
                autoPlayDuration: new Duration(seconds: 0),
                autoPlay: false),
          ),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new IconButton(
           icon: Icon(Icons.view_list),
            color: const Color(0xFF3401ab),
            onPressed: () => {},
        ),
        new Text('List View', style: TextStyle(
          color: const Color(0xFF3401ab)
        ),)
          ],
        )
      ],
    );
  }
}

class AppWidget extends StatelessWidget {
  final String appName;
  final Image image;
  final Color color;

  AppWidget(
      {@required this.appName, @required this.image, @required this.color});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: new BoxDecoration(),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: image,
            ),
            new Text(
              appName,
              style: TextStyle(fontFamily: 'Montserrat'),
            )
          ],
        ),
      ),
    );
  }
}
