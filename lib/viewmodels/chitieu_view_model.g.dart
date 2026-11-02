// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chitieu_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChiTieuViewModel)
final chiTieuViewModelProvider = ChiTieuViewModelProvider._();

final class ChiTieuViewModelProvider
    extends $AsyncNotifierProvider<ChiTieuViewModel, List<ChiTieu>> {
  ChiTieuViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chiTieuViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chiTieuViewModelHash();

  @$internal
  @override
  ChiTieuViewModel create() => ChiTieuViewModel();
}

String _$chiTieuViewModelHash() => r'0dce9ad7f8ffe96a6964feaccbf9435eaaa47fc0';

abstract class _$ChiTieuViewModel extends $AsyncNotifier<List<ChiTieu>> {
  FutureOr<List<ChiTieu>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<ChiTieu>>, List<ChiTieu>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ChiTieu>>, List<ChiTieu>>,
              AsyncValue<List<ChiTieu>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
