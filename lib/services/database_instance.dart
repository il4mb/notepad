import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../model/note_model.dart';

class DatabaseInstance {
  final String _databaseName = 'note_database.db';
  final int _databaseVersion = 1;

  // Product Table
  final String table = 'note';
  final String id = 'id';
  final String title = 'title';
  final String note = 'note';
  final String category = 'category';
  final String createdAt = 'created_at';
  final String updateAt = 'update_at';

  Database? _database;
  Future<Database> database() async{
    if (_database !=null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async{
    await db.execute(
        'CREATE TABLE $table ($id INTEGER PRIMARY KEY, $title TEXT NULL, $note TEXT, $category TEXT NULL, $createdAt TEXT NULL, $updateAt TEXT NULL)'
    );
  }

  Future<List<NoteModel>> all() async{
    final data = await _database!.query(table);
    List<NoteModel> result =
    data.map((e) => NoteModel.fromJson(e)).toList();
    print(result);
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async{
    final query = await _database!.insert(table, row);
    return query;
  }
}