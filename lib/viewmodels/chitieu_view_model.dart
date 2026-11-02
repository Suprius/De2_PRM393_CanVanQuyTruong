import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/chitieu.dart';
import '../repositories/chitieu_repository.dart';

part 'chitieu_view_model.g.dart';

@riverpod
class ChiTieuViewModel extends _$ChiTieuViewModel {
  final _repository = ChiTieuRepository();

  @override
  Future<List<ChiTieu>> build() => _repository.getAll();

  Future<void> save(ChiTieu chitieu) async {
    await _repository.update(chitieu);
    state = AsyncData(await _repository.getAll());
  }
}
