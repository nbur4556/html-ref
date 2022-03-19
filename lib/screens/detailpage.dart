import 'package:flutter/material.dart';
import 'package:html_ref/models/ref_tag.dart';
import '../types/tag_arguments.dart';

class Detailpage extends StatelessWidget {
  List<RefTag> tagData;
  Detailpage(this.tagData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TagArguments args =
        ModalRoute.of(context)!.settings.arguments as TagArguments;

    final int id = args.id;
    final RefTag tag = tagData[id];

    return Scaffold(
      appBar: AppBar(
        title: Text('<' + tag.tagName + '>'),
        centerTitle: true,
      ),
      body: DetailContent(tag),
    );
  }
}

class DetailContent extends StatelessWidget {
  RefTag tag;
  DetailContent(this.tag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DetailTextSection(tag.description),
        DetailTextSection(tag.attributes),
      ],
    );
  }
}

class DetailTextSection extends StatelessWidget {
  String content;
  DetailTextSection(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(content),
    );
  }
}
