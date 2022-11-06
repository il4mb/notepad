import 'package:flutter/material.dart';
import 'package:notepad/database/DataBase.dart';
import 'package:notepad/database/kategoriDAO.dart';
import '/main.dart';
import '/object/kategori.dart';

Future<void> main() async {

  final database =
      await $FloorDataBase.databaseBuilder('_database.db').build();
  final dao = database.kategoriDAO;
  runApp(KategoriFrame(dao));

}

class KategoriFrame extends StatelessWidget {
  //const KategoriFrame({super.key});

  final KategoriDAO? Dao;
  const KategoriFrame(KategoriDAO dao, {this.Dao, super.key});

  @override
  Widget build(BuildContext context) {

    var kategori = [Kategori(1, "name")];
    var len = kategori.length;

    return MaterialApp(
      title: MyApp.APPNAME,

      home: Scaffold(
          appBar: AppBar(
            title: Text(""),
          ),
          body: Column(
            children: [

              const Padding (
                padding: EdgeInsets.all(15), //apply padding to all four sides
                child: Text(""),
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
                              Text(kategori[index].name,
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
