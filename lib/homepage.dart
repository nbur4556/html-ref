import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      children: tagButtons,
    );
  }
}

class TagButton extends StatelessWidget {
  final String tagName;
  TagButton(this.tagName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Text('<$tagName>'),
    );
  }
}
