import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import './screens/Page1.dart' as First;
import './screens/Page2.dart' as Second;
import './screens/Page3.dart' as Third;
import './screens/Page4.dart' as Four;
import './screens/Messages.dart' as Messages;
import 'package:stellaris/screens/widgets.dart';

class HomePage extends StatelessWidget {

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
              mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               new IconButton(icon: Icon(Icons.menu),
               color: Colors.white,
               iconSize: 28.0,
               alignment: Alignment.centerLeft,
               onPressed: () => _drawer(),
               ),
                new IconButton(icon: Icon(Icons.fingerprint),
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

class _drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new CachedNetworkImage(
             imageUrl: "https://avatars.io/instagram/a.i.d.x.n"
          )
        ],
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