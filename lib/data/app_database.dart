import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();
  Database? _database;

  Future<Database> get database async => _database ??= await _open();

  Future<Database> _open() async => openDatabase(
    join(await getDatabasesPath(), 'chitieu.db'),
    version: 1,
    onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
    onCreate: (db, version) async {
      await db.execute('''
            CREATE TABLE categories(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL
            )
          ''');
      await db.execute('''
            CREATE TABLE chitieu(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              amount REAL NOT NULL,
              category_id INTEGER NOT NULL,
              date TEXT NOT NULL,
              FOREIGN KEY(category_id) REFERENCES categories(id)
            )
          ''');

      for (final name in ['Sinh hoạt', 'Đi lại', 'Học tập', 'Sức khỏe']) {
        await db.insert('categories', {'name': name});
      }

      final rows = [
        ['Ăn uống', 150000.0, 1, '2026-10-29'],
        ['Di chuyển', 50000.0, 2, '2026-10-28'],
        ['Mua sách', 200000.0, 3, '2026-10-27'],
        ['Mua sắm', 1500000.0, 1, '2026-10-25'],
        ['Khám bệnh', 3550000.0, 4, '2026-10-22'],
      ];
      for (final row in rows) {
        await db.insert('chitieu', {
          'name': row[0],
          'amount': row[1],
          'category_id': row[2],
          'date': row[3],
        });
      }
    },
  );
}
