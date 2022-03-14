import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../types/tag_arguments.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  Future<List<dynamic>> loadData() async {
    dynamic data = await rootBundle.loadString('assets/text_assets/data.json');
    return json.decode(data);
  }

  Widget buildWithData(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return TagGrid(snapshot.data as List<dynamic>);
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) => buildWithData(context, snapshot),
      ),
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
      tagButtons.add(TagButton(tag));
    });

    return GridView.count(
      crossAxisCount: columnCount,
      padding: EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: tagButtons,
    );
  }
}

class TagButton extends StatelessWidget {
  final String tagName;
  TagButton(this.tagName, {Key? key}) : super(key: key);

  void handleRoute(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/details',
      arguments: TagArguments(tagName),
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
