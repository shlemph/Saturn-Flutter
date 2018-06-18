import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import './screens/Page1.dart' as First;
import './screens/Page2.dart' as Second;
import './screens/Page3.dart' as Third;
import './screens/Page4.dart' as Four;
import './screens/Messages.dart' as Messages;
import 'package:stellaris/screens/widgets.dart';

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
          return new Container(
          height: 400.0,
          color: Colors.white,
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new FlatButton(child: new Text("X", style: new TextStyle(fontSize: 18.0),), onPressed: () {})
                  ],
                ),
                new Divider(color: Colors.black26,)
              ],
            ),
          ),
        );
        }
      );
    }

  @override
  Widget build(BuildContext context) {
    return new Material(
      shadowColor: Colors.pink,
      child: new Scaffold(
        body: Messages.Messages(),
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
                    icon: Icon(Icons.search), color: Colors.white, onPressed: () => {},),
              ),
              new IconButton(
                icon: Icon(Icons.person),
                alignment: Alignment.centerRight,
                color: Colors.white,
                onPressed: () => Navigator.of(context).pushNamed("/Page4"),
                iconSize: 28.0,
              ),
            ],
          ),
        ),
        floatingActionButton: FAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
