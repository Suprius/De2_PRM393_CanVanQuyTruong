import '../data/app_database.dart';
import '../models/category.dart';

class CategoryRepository {
  Future<List<Category>> getAll() async {
    final db = await AppDatabase.instance.database;
    final rows = await db.query('categories', orderBy: 'id');
    return rows.map(Category.fromMap).toList();
  }
}
