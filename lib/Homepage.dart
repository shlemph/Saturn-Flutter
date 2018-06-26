import 'package:flutter/material.dart';
import './screens/Messages.dart' as Messages;
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';
import './AppModel.dart';

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
                          icon: new Icon(Icons.keyboard_arrow_down), onPressed: () {},
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
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<AppModel>(
      builder: (context, child, model) =>
         new Material(
        shadowColor: Colors.pink,
        child: new Scaffold(
          body: Messages.Messages(),
          appBar: new AppBar(
            title: new Text(
              model.name.toString() ,
              style: new TextStyle(color: Colors.black),
            ),
            leading: new Container(),
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
                  onPressed: () => Navigator.of(context).pushNamed("/Page4"),
                  iconSize: 28.0,
                ),
              ],
            ),
          ),
          floatingActionButton: FAB(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
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

  MenuItem({
    @required this.text,
    @required this.icon
  }); 

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
              icon: icon, onPressed: () {},
            ),
            new Text(text)
          ],
        ),
      ),
    );
  }
}
