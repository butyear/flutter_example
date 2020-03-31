import 'package:flutter/material.dart';

class BottomTabPage extends StatefulWidget {
  @override
  _BottomTabPageState createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: getTabPageBody(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text('List')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('Setting'))
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }

  Widget getTabPageBody(index) {
    switch (index) {
      case 0:
        return Text('Home Page');
        break;
      case 1:
        return Text('List Page');
        break;
      case 2:
        return Text('Setting Page');
        break;
      default:
        return null;
    }
  }
}
