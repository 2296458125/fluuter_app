import 'package:flutter/material.dart';

class Shopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("我的购物车"),
      ),
    );
  }
}
