import 'dart:html';

class Note {

  DateTime date_create, last_edit;
  String text_body, text_title;

  Note(this.date_create, this.text_body, this.text_title) : this.last_edit = DateTime.now();

  dateCreate(DateTime dateTime) {
    date_create = dateTime;
  }
  lastEdit(DateTime dateTime) {
    last_edit = dateTime;
  }

}