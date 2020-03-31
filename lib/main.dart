import 'package:flutter/material.dart';
import 'package:startup_namer/bottom_tab_page.dart';
import 'package:startup_namer/random_word_page.dart';

void main() => runApp(materialAppContainer());

Widget materialAppContainer() {
  // Make wrapper for ui testing.
  return MaterialApp(
      title: 'Flutter Sample App',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: AppPage());
}

class AppPage extends StatefulWidget {
  // Make it stateful for handling appbar title and content page.
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  String _title = 'Flutter Example App';
  int _drawerPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('butyear@gmail.com')),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueGrey, Colors.blueGrey[200]])),
            ),
            ListTile(
              title: Text('Home'),
              trailing: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _title = 'Flutter Example App';
                  _drawerPageIndex = 0;
                });
              },
            ),
            ListTile(
              title: Text('Random Words'),
              trailing: Icon(Icons.low_priority),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _title = 'Random Name Generator';
                  _drawerPageIndex = 1;
                });
              },
            ),
            ListTile(
              title: Text('Bottom Tab'),
              trailing: Icon(Icons.table_chart),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _title = 'Bottom Tab Page';
                  _drawerPageIndex = 2;
                });
              },),
            ListTile(),
            ListTile(),
          ],
        ),
      ),
      body: drawerPageRouter(),
    );
  }

  Widget drawerPageRouter() {
    if (_drawerPageIndex == 0) {
      return firstPage();
    } else if (_drawerPageIndex == 1) {
      return RandomWords();
    } else if (_drawerPageIndex == 2) {
      return BottomTabPage();
    } else {
      return firstPage();
    }
  }

  Widget firstPage() {
    return Center(child: Text('This is a sample app for practice'));
  }
}
