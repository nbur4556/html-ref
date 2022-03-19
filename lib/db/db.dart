import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Models
import '../models/ref_tag.dart';

class Database {
  String _dbName = 'html_ref_tags';
  int _dbVersion = 1;

  Future<dynamic> open() async {
    return openDatabase(
      join(await getDatabasesPath(), '$_dbName.db'),
      version: _dbVersion,
      onCreate: (db, version) => db.execute(
          'CREATE TABLE ref_tag(id INTEGER PRIMARY KEY, tag_name TEXT, description TEXT, attributes TEXT)'),
    );
  }

  Future<void> insert() async {
    final db = await this.open();

    RefTag testRefTag =
        RefTag(id: 1, tagName: 'test', description: 'test', attributes: 'test');

    await db.insert('ref_tag', testRefTag.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
