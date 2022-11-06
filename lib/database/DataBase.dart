// database.dart

// required package imports

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../object/kategori.dart';
import 'kategoriDAO.dart';

part 'DataBase.g.dart';

@Database(version: 1, entities: [Kategori])
abstract class DataBase extends FloorDatabase {
  KategoriDAO get kategoriDAO;
}