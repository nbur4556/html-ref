import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Models
import '../models/ref_tag.dart';

class Database {
  String dbName = 'html_ref_tags.db';
  int versionNum = 1;

  Future<dynamic> open() async {
    Map testRefTag =
        RefTag(id: 1, tagName: 'test', description: 'test', attributes: 'test')
            .toMap();

    print(testRefTag);

    return openDatabase(
      join(await getDatabasesPath(), dbName),
      version: versionNum,
      onCreate: (db, version) => db.execute(
          'CREATE TABLE ref_tag(id INTEGER PRIMARY KEY, tag_name TEXT, description TEXT, attributes TEXT)'),
    );
  }
}
