class ChiTieu {
  const ChiTieu({
    this.id,
    required this.name,
    required this.amount,
    required this.categoryId,
    required this.date,
  });

  final int? id;
  final String name;
  final double amount;
  final int categoryId;
  final DateTime date;

  Map<String, Object?> toMap() => {
    'id': id,
    'name': name,
    'amount': amount,
    'category_id': categoryId,
    'date': date.toIso8601String(),
  };

  factory ChiTieu.fromMap(Map<String, Object?> map) => ChiTieu(
    id: map['id'] as int,
    name: map['name'] as String,
    amount: (map['amount'] as num).toDouble(),
    categoryId: map['category_id'] as int,
    date: DateTime.parse(map['date'] as String),
  );
}
