import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Database {
  String dbName = 'html_ref_tags.db';

  dynamic open() async {
    return openDatabase(join(await getDatabasesPath(), dbName));
  }
}
