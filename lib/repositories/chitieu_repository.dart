import '../data/app_database.dart';
import '../models/chitieu.dart';

class ChiTieuRepository {
  Future<List<ChiTieu>> getAll() async {
    final db = await AppDatabase.instance.database;
    final rows = await db.query('chitieu', orderBy: 'date DESC');
    return rows.map(ChiTieu.fromMap).toList();
  }

  Future<void> update(ChiTieu chitieu) async {
    final db = await AppDatabase.instance.database;
    final data = chitieu.toMap()..remove('id');
    await db.update('chitieu', data, where: 'id = ?', whereArgs: [chitieu.id]);
  }
}
