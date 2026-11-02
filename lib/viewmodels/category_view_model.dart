import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/category.dart';
import '../repositories/category_repository.dart';

part 'category_view_model.g.dart';

@riverpod
class CategoryViewModel extends _$CategoryViewModel {
  @override
  Future<List<Category>> build() => CategoryRepository().getAll();
}
