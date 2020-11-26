import 'package:flutter/material.dart';

class Apps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分类"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("商品分类"),
      ),
    );
  }
}
