import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TagGrid(),
    );
  }
}

class TagGrid extends StatelessWidget {
  final int columnCount = 3;
  TagGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: columnCount,
      children: [
        TagButton('!DOCTYPE'),
        TagButton('html'),
        TagButton('head'),
        TagButton('title'),
        TagButton('body'),
        TagButton('h1'),
        TagButton('p'),
        TagButton('br'),
        TagButton('hr'),
        TagButton('!--...--'),
      ],
    );
  }
}

class TagButton extends StatelessWidget {
  final String tagName;
  TagButton(this.tagName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('test'),
      child: Text('<$tagName>'),
    );
  }
}
