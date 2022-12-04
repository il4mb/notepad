import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/database_instance.dart';

class InputScreen extends StatefulWidget{
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    databaseInstance.database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Judul'),
            TextField(controller: titleController,),
            SizedBox(height: 15,),
            Text('Tulis catatan mu'),
            TextField(
              controller: noteController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            SizedBox(height: 15,),
            Text('Kategori'),
            TextField(controller: categoryController,),
            SizedBox(height: 15,),
            ElevatedButton(
                onPressed: () async {
                  await databaseInstance.insert({
                    'title' : titleController.text,
                    'note' : noteController.text,
                    'category' : categoryController.text,
                    'created_at' : DateTime.now().toString(),
                    'update_at' : DateTime.now().toString()
                  });
                  Navigator.pop(context);
                  setState(() {

                  });
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}