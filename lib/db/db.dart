import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Database {
  String dbName = 'html_ref_tags.db';
  int versionNum = 1;

  dynamic open() async {
    return openDatabase(join(await getDatabasesPath(), dbName),
        onCreate: (db, version) => db.execute(
            'CREATE TABLE ref_tag(id INTEGER PRIMARY KEY, tag_name TEXT, description TEXT, attributes TEXT)'),
        version: versionNum);
  }
}
