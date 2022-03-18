import 'package:flutter/material.dart';
import '../types/tag_arguments.dart';

class Detailpage extends StatelessWidget {
  Detailpage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final TagArguments args =
        ModalRoute.of(context)!.settings.arguments as TagArguments;

    final String tagName = args.tagName;

    return Scaffold(
      appBar: AppBar(
        title: Text('<$tagName>'),
        centerTitle: true,
      ),
      body: DetailContent(),
    );
  }
}

class DetailContent extends StatelessWidget {
  DetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DetailTextSection(),
        DetailTextSection(),
      ],
    );
  }
}

class DetailTextSection extends StatelessWidget {
  DetailTextSection({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
    );
  }
}
