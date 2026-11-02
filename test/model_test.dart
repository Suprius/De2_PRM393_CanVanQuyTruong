import 'package:flutter_test/flutter_test.dart';
import 'package:pe_prm393/models/category.dart';
import 'package:pe_prm393/models/chitieu.dart';

void main() {
  test('Category converts database map', () {
    const item = Category(id: 1, name: 'Sinh hoạt');
    expect(Category.fromMap(item.toMap()).name, 'Sinh hoạt');
  });

  test('ChiTieu converts database map', () {
    final item = ChiTieu(
      id: 1,
      name: 'Ăn uống',
      amount: 150000,
      categoryId: 1,
      date: DateTime(2026, 10, 29),
    );
    expect(ChiTieu.fromMap(item.toMap()).amount, 150000);
  });
}
