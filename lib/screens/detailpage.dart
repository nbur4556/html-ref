import 'package:flutter/material.dart';
import 'package:html_ref/models/ref_tag.dart';
import '../types/tag_arguments.dart';
import '../styles/font_styles.dart';

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
        Center(child: DetailTextSection(tag.description)),
        Center(
            child: DetailTextSection(tag.attributes, heading: 'Attributes: ')),
      ],
    );
  }
}

class DetailTextSection extends StatelessWidget {
  String heading = '';
  String content;
  DetailTextSection(this.content, {String heading = '', Key? key})
      : super(key: key) {
    this.heading = heading;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      child: Card(
        margin: EdgeInsets.all(24.0),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  heading,
                  style: CardHeadingStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(content),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
