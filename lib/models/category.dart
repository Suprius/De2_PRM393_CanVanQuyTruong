class Category {
  const Category({this.id, required this.name});

  final int? id;
  final String name;

  Map<String, Object?> toMap() => {'id': id, 'name': name};

  factory Category.fromMap(Map<String, Object?> map) =>
      Category(id: map['id'] as int, name: map['name'] as String);
}
