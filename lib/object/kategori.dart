import 'package:notepad/kategori.dart';

class Kategori {

  static List<Kategori> defaultVal = [Kategori(1, "Daily"), Kategori(2, "Tugas"), Kategori(3, "Job"), Kategori(4, "Rutinitas")];


  var id;
  var value;
  Kategori(int this.id, String this.value);
}