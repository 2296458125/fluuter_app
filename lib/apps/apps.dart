import 'package:flutter/material.dart';

class Apps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分类"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
