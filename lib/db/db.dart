import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Models
import '../models/ref_tag.dart';

class Database {
  String _dbName = 'html_ref_tags';
  String _dbTable = 'ref_tag';
  int _dbVersion = 1;

  // Return an opened database
  Future<dynamic> open() async {
    dynamic sqlData = await rootBundle.loadString('assets/seed.sql');

    return openDatabase(
      join(await getDatabasesPath(), '$_dbName.db'),
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE $_dbTable(id INTEGER PRIMARY KEY, tag_name TEXT, description TEXT, attributes TEXT)');

        // Initial data
        LineSplitter().convert(sqlData).forEach((cmd) async {
          print(cmd);
          await db.rawInsert(cmd);
        });
      },
    );
  }

  // Delete Database
  Future<void> dropDatabase() async {
    databaseFactory
        .deleteDatabase(join(await getDatabasesPath(), '$_dbName.db'));
  }

  // Insert RefTag into database
  Future<void> insert(id, tagName, description, attributes) async {
    final db = await this.open();

    RefTag insertTag = RefTag(
      id: id,
      tagName: tagName,
      description: description,
      attributes: attributes,
    );

    await db.insert(_dbTable, insertTag.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Read all RefTags from database
  Future<List<RefTag>> getAllRefTags() async {
    final db = await this.open();
    final List<Map<String, dynamic>> maps = await db.query(_dbTable);

    return List.generate(maps.length, (i) {
      return RefTag(
        id: maps[i]['id'],
        tagName: maps[i]['tag_name'],
        description: maps[i]['description'],
        attributes: maps[i]['attributes'],
      );
    });
  }
}
