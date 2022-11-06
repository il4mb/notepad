import 'package:floor/floor.dart';
import 'package:notepad/object/kategori.dart';

abstract class KategoriDAO {

  @Query('SELECT * FROM kategori')
  Future<List<Kategori>> findAllKategori();

  @Query('SELECT * FROM kategori WHERE id = :id')
  Stream<Kategori?> findKategoriById(int id);

  @Query('SELECT * FROM kategori WHERE name LIKE %:name%')
  Stream<Kategori?> findKategoriByName(String name);

  @insert
  Future<void> insertPerson(Kategori kategori);
}