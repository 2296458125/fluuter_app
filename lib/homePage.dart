import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final _suggestions = <WordPair>[];
  final _biggerFont = new TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "无限滚动",
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    //添加路由
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map(
        (pair) {
          return new ListTile(
            title: new Text(pair.asPascalCase, style: _biggerFont),
          );
        },
      );
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("已收藏"),
        ),
        body: new ListView(children: divided),
      );
    }));
  }
}
