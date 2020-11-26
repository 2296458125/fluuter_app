import 'package:flutter/material.dart';
import './apps.dart';
import './adjust.dart';
import './person.dart';
import './shopping.dart';
import './homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'flutter app',
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final pages = [HomePage(), Apps(), Adjust(), Shopping(), Person()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text(
              "首页",
              // style: TextStyle(color: Colors.red),
            ),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text(
              "分类",
              // style: TextStyle(color: Colors.red),
            ),
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            title: Text(
              "发现",
              // style: TextStyle(color: Colors.red),
            ),
            icon: Icon(Icons.adjust),
          ),
          BottomNavigationBarItem(
            title: Text(
              "购物车",
              // style: TextStyle(color: Colors.red),
            ),
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            title: Text(
              "我的",
              // style: TextStyle(color: Colors.red),
            ),
            icon: Icon(Icons.person),
          ),
        ],
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        onTap: (context) {
          setState(() {
            _currentIndex = context;
          });
        },
        selectedItemColor: Colors.blue,
      ),
      body: pages[_currentIndex],
    );
  }
}
