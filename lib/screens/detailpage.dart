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
      body: Center(
        child: Text('<$tagName>'),
      ),
    );
  }
}
