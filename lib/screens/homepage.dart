import 'package:flutter/material.dart';
import '../types/tag_arguments.dart';

class Homepage extends StatelessWidget {
  final List<dynamic> tagData;
  Homepage(this.tagData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TagGrid(tagData),
    );
  }
}

class TagGrid extends StatelessWidget {
  final int columnCount = 3;
  final List<dynamic> data;

  TagGrid(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> tagButtons = <Widget>[];

    data.forEach((tag) {
      tagButtons.add(TagButton(tag.tagName, tag.id));
    });

    return GridView.count(
      crossAxisCount: columnCount,
      padding: EdgeInsets.all(24),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: tagButtons,
    );
  }
}

class TagButton extends StatelessWidget {
  final String tagName;
  final int id;
  TagButton(this.tagName, this.id, {Key? key}) : super(key: key);

  void handleRoute(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/details',
      arguments: TagArguments(id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => handleRoute(context),
      child: Text('<$tagName>'),
    );
  }
}
