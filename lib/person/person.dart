import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的信息"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("我的信息"),
      ),
    );
  }
}
