import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  Detailpage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tag Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Tag Details'),
      ),
    );
  }
}
