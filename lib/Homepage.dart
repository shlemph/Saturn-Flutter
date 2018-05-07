import 'package:flutter/material.dart';
import './screens/Page1.dart' as First;
import './screens/Page2.dart' as Second;
import './screens/Page3.dart' as Third;
import './screens/Page4.dart' as Four;



class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}


class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.people_outline)),
            new Tab(icon: new Icon(Icons.search)),
            new Tab(icon: new Icon(Icons.history)),
            new Tab(icon: new Icon(Icons.fingerprint))
          ],
          indicatorColor: Colors.purple,
          labelColor: Colors.deepPurple,
          unselectedLabelColor: Colors.black,
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new First.First(),
          new Second.Second(),
          new Third.Third(),
          new Four.Four()
        ],
      ),
    );
  }

}
