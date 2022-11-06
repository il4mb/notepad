import 'dart:ui';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:notepad/database/DataBase.dart';
import 'package:notepad/kategori.dart';

@Entity(tableName: "kategori")
class Kategori {

  //DataBase dataBase = new DataBase;

  @PrimaryKey(autoGenerate: true)
  final int id;

  final String name;
  Kategori(this.id, this.name);
}