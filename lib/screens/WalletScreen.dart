
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class CoinWidget extends StatelessWidget {
  final String name;
  final double balance;
  final Image logo;
  final Color color;
  final Color shadowColor;

  CoinWidget(
      {@required this.name,
      @required this.balance,
      @required this.logo,
      @required this.color,
      @required this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: new Container(
        height: 80.0,
        width: 400.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              logo,
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  height: 100.0,
                  width: 170.0,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(name,
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: color,
                              fontFamily: 'Montserrat')),
                      new Text(
                        balance.toString(),
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: color,
                            fontFamily: 'Montserrat'),
                      )
                    ],
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: new Container(
                    height: 50.0,
                    width: 90.0,
                    child: new Text(
                      "\$0.00 USD",
                      style: new TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24.0,
                          color: color),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AssetListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new CoinWidget(
        balance: 14.0,
        color: const Color(0xFF987EFF),
        logo: new Image.asset(
          'assets/logo.jpeg',
          width: 50.0,
          height: 50.0,
        ),
        name: 'Saturn Rings',
        shadowColor: const Color(0xFFD8CEFF),
      ),
      new CoinWidget(
        balance: 23.0,
        color: Colors.blueGrey,
        logo: new Image.asset(
          'assets/ETHEREUM-ICON_Black_small.png',
          width: 50.0,
          height: 50.0,
        ),
        name: 'Ethereum',
        shadowColor: const Color(0xFFD8D8D8),
      ),
      new CoinWidget(
        balance: 42.0000,
        color: const Color(0xFF379FFF),
        logo: new Image.asset(
          'assets/Twitter_avatar.png',
          height: 50.0,
          width: 50.0,
        ),
        name: 'Stellar Lumens',
        shadowColor: const Color(0xFFCFE8FF),
      ),
      new CoinWidget(
        balance: 0.43052,
        color: const Color(0xFFFFCB8F),
        logo: new Image.asset(
          'assets/BC_Logo_.png',
          height: 50.0,
          width: 50.0,
        ),
        name: 'Bitcoin',
        shadowColor: const Color(0xFFFFF0DF),
      )
    ]);
  }
}

class TotalValueWidget extends StatelessWidget {
  final math.Random random = new math.Random();

   List<double> _generateRandomData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add(random.nextDouble() * 100);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final data = _generateRandomData(10);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
          width: 400.0,
          height: 150.0,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: <BoxShadow>[
                new BoxShadow(
                    color: Color(0xFFD7DDE8),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: new Offset(0.0, 10.0))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  '\$0.00 USD',
                  style: new TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new Text(
                  'Total USD Value',
                  style: new TextStyle(color: Colors.blueGrey),
                ),
                new Sparkline(
                  data: data,
                  lineColor: Colors.white,
                  fallbackHeight: 96.0,
                  fillMode: FillMode.below,
                  lineGradient: new LinearGradient(
                    colors: [
                      const Color(0xFF4776E6),
                      const Color(0xFF8E54E9)
                    ]
                  ),
                  fillGradient: new LinearGradient(
                    colors: [
                      const Color(0xFFFFFFFF),
                      const Color(0xFFD7DDE8)
                    ]
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomAppBar(
//        hasNotch: true,
        color: const Color(0xFF3401ab),
        child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BackButton(
                    color: Colors.white,
                  ),
                ],
              ),
      ),
      appBar: new AppBar(
              leading: new SizedBox(),
              title: new Text("Your Wallet", style: new TextStyle(color: Colors.black, fontFamily: 'Montserrat'),),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
      floatingActionButton: new FloatingActionButton(
                onPressed: () => {},
                elevation: 5.0,
//                notchMargin: 7.0,
                highlightElevation: 1.0,
                backgroundColor: Colors.black,
                child: Icon(Icons.add),
            ), floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          body: new Column(
        children: <Widget>[
          new TotalValueWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 1.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Assets",
                  style: new TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          new AssetListWidget()
        ],
      ),
    );
  }
}
