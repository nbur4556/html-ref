class RefTag {
  final int id;
  final String tagName;
  final String description;
  String? attributes;

  RefTag(
      {required this.id,
      required this.tagName,
      required this.description,
      this.attributes});

  Map toMap() => {
        'id': this.id,
        'tag_name': this.tagName,
        'description': this.description,
        'attributes': this.attributes
      };
}
