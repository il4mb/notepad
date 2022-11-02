import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '/main.dart';
import '/object/kategori.dart';

void main() {
  runApp(const KategoriFrame());
}

class KategoriFrame extends StatelessWidget {
  const KategoriFrame({super.key});

  @override
  Widget build(BuildContext context) {

    var len = Kategori.defaultVal.length;

    return MaterialApp(
      title: MyApp.APPNAME,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Pilih kategori"),
          ),
          body: Column(
            children: [

              Padding(
                padding: EdgeInsets.all(15), //apply padding to all four sides
                child: Text("Kamu punya $len kategori"),
              ),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(len, (index) {
                    return Card(
                        margin: EdgeInsets.all(15.0),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.folder,
                                color: Colors.blueGrey,
                                size: 75.0,
                              ),
                              Text(Kategori.defaultVal[index].value,
                                  style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ));
                  }),
                ),
              ),

            ],

          )),
    );
  }
}
