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
  TagGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        OutlinedButton(
          onPressed: () => print('test'),
          child: Text('<Tag>'),
        ),
        OutlinedButton(
          onPressed: () => print('test'),
          child: Text('<Tag>'),
        )
      ],
    );
  }
}
