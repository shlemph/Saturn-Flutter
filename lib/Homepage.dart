import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './AppModel.dart';
import './screens/Dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => new Scaffold(
        backgroundColor: new Color(0xFFF8F8FF),
            body: Dashboard(),
            appBar: new AppBar(
              centerTitle: true,
              title: new Text(
                'Saturn',
                style: new TextStyle(
                    color: const Color(0xFF3401ab), fontFamily: 'Montserrat' ),
              ),
              leading: new SizedBox(),
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            bottomNavigationBar: new BottomAppBar(
              //hasNotch: true,
              color: new Color(0xFFFFFFFF),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new IconButton(
                    icon: Icon(Icons.home),
                    color: Colors.grey,
                    iconSize: 28.0,
                    alignment: Alignment.centerLeft,
                    onPressed: () => {},
                  ),
                  new IconButton(
                    icon: Icon(Icons.account_balance_wallet),
                    color: Colors.grey,
                    onPressed: () => Navigator.of(context).pushNamed("/WalletScreen"),
                  ),
                  new SizedBox(
                     width: 80.0,
                  ),
                  new IconButton(
                    icon: Icon(Icons.storage),
                    color: Colors.grey,
                    onPressed: () => {},
                  ),
                  new IconButton(
                    icon: Icon(Icons.person),
                    splashColor: Colors.purple,
                    alignment: Alignment.centerRight,
                    color: Colors.grey,
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
      //notchMargin: 7.0,
      highlightElevation: 1.0,
      backgroundColor: Colors.black,
      tooltip: 'Add an App',
      child: Icon(Icons.add),
    );
  }
}

