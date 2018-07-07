import 'package:flutter/material.dart';
import './screens/Messages.dart' as Messages;
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';
import './AppModel.dart';
import 'screens/UserProfile.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Material(
              elevation: 5.0,
              child: new Container(
                height: 400.0,
                color: Colors.white,
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(Icons.keyboard_arrow_down),
                            onPressed: () {},
                          )
                        ],
                      ),
                      new MenuItem(
                        icon: Icon(Icons.iso),
                        text: 'placeholder 2',
                      ),
                      new MenuItem(
                        icon: new Icon(Icons.invert_colors_off),
                        text: 'placeholder 3',
                      ),
                      new MenuItem(
                        icon: new Icon(Icons.invert_colors_off),
                        text: 'placeholder 4',
                      ),
                      new MenuItem(
                        icon: new Icon(Icons.invert_colors_off),
                        text: 'placeholder 5',
                      ),
                      new MenuItem(
                        icon: new Icon(Icons.invert_colors_off),
                        text: 'placeholder 6',
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => new Scaffold(
            body: Wallet(),
            appBar: new AppBar(
              centerTitle: true,
              title: new Text(
                'Your Wallet',
                style: new TextStyle(
                    color: Colors.black, fontFamily: 'Montserrat'),
              ),
              leading: new SizedBox(),
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            bottomNavigationBar: new BottomAppBar(
              hasNotch: true,
              color: new Color(0xFF6200ea),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    iconSize: 28.0,
                    alignment: Alignment.centerLeft,
                    onPressed: _showModalSheet,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 200.0),
                    child: new IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () => {},
                    ),
                  ),
                  new IconButton(
                    icon: Icon(Icons.person),
                    alignment: Alignment.centerRight,
                    color: Colors.white,
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/UserProfile"),
                    iconSize: 28.0,
                  ),
                ],
              ),
            ),
            floatingActionButton: FAB(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
    );
  }
}

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: () => {},
      elevation: 5.0,
      notchMargin: 7.0,
      highlightElevation: 1.0,
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final Icon icon;

  MenuItem({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: new Row(
          children: <Widget>[
            new IconButton(
              icon: icon,
              onPressed: () {},
            ),
            new Text(text)
          ],
        ),
      ),
    );
  }
}

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
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        height: 80.0,
        width: 400.0,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: shadowColor,
                blurRadius: 10.0,
                spreadRadius: 0.0,
                offset: new Offset(0.0, 10.0),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
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
          height: 100.0,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: <BoxShadow>[
                new BoxShadow(
                    color: Color(0xFF6E74FF),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: new Offset(0.0, 5.0))
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
                  fallbackHeight: 40.0,
                  fillMode: FillMode.below,
                  fillGradient: new LinearGradient(
                    colors: [
                      const Color(0xFF6E74FF),
                      const Color(0xFF379FFF)
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
    return new Column(
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
    );
  }
}
