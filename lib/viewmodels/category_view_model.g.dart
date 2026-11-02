// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryViewModel)
final categoryViewModelProvider = CategoryViewModelProvider._();

final class CategoryViewModelProvider
    extends $AsyncNotifierProvider<CategoryViewModel, List<Category>> {
  CategoryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryViewModelHash();

  @$internal
  @override
  CategoryViewModel create() => CategoryViewModel();
}

String _$categoryViewModelHash() => r'0e96666dcb5aa23b6ff299b89b47de1a2cb1f0dc';

abstract class _$CategoryViewModel extends $AsyncNotifier<List<Category>> {
  FutureOr<List<Category>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Category>>, List<Category>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Category>>, List<Category>>,
              AsyncValue<List<Category>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
