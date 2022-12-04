class NoteModel {
  int? id;
  String? title, note, category, createdAt, updateAt;

  NoteModel(
      {this.id, this.title, this.note, this.category, this.createdAt, this.updateAt});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
        id: json['id'],
        title: json['title'],
        note: json['note'],
        category: json['category'],
        createdAt: json['created_at'],
        updateAt: json['update_at']
    );
  }
}