import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notepad/services/database_instance.dart';
import '../../model/note_model.dart';
import '../../widgets/note_card.dart';
import '../../widgets/search_input.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  DatabaseInstance databaseInstance = DatabaseInstance();

  late TextEditingController _inputSearchController;
  @override
  void initState() {
    databaseInstance.database();
    super.initState();
    _inputSearchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchInput(
          controller: _inputSearchController,
          hint: 'Search notes',
          onChanged: (query) {
            log('search: $query');
          },
        ),
        FutureBuilder<List<NoteModel>>(
            future: databaseInstance.all(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(snapshot.data!.length == 0){
                  return Center(
                    child: Text('Data masih kosong.'),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].title ?? ''),
                        subtitle: Text(snapshot.data![index].note ?? ''),
                      );
                    }
                );
              }else{
                return Center(
                    child: CircularProgressIndicator(color: Colors.green,));
              }
            }
        ),
        // Expanded(
        //   child: MasonryGridView.count(
        //     itemCount: 4,
        //     crossAxisCount: 2,
        //     mainAxisSpacing: 12,
        //     crossAxisSpacing: 12,
        //     padding: const EdgeInsets.all(16),
        //     itemBuilder: (context, index) => NoteCard(index: index),
        //   ),
        // )
      ],
    );
  }
}



