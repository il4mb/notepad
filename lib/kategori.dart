import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/main.dart';

void main() {
  runApp(const Kategori());
}

class Kategori extends StatelessWidget {
  const Kategori({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> ss = [
      new Text("RADIO"),
      Text("TV"),
      TextField()
      ];
    return MaterialApp(
      title: MyApp.APPNAME,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pilih kategori"),
        ),
        body: Center(
          child: ListView(
            children: ss,
          ),
        ),
      ),
    );
  }
}