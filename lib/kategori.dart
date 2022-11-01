import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/main.dart';
import '/object/kategori.dart';

void main() {
  runApp(const KategoriFrame());
}

class KategoriFrame extends StatelessWidget {
  const KategoriFrame({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> ListKat = <Widget>[];
    for(var val in Kategori.defaultVal) {

      ListKat.add(Text(val.value));
    }

    return MaterialApp(
      title: MyApp.APPNAME,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pilih kategori"),
        ),
        body: Center(
          child: ListView(
            children: ListKat,
          ),
        ),
      ),
    );
  }
}