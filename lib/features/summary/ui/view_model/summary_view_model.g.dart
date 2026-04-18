// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SummaryViewModel)
final summaryViewModelProvider = SummaryViewModelProvider._();

final class SummaryViewModelProvider
    extends $AsyncNotifierProvider<SummaryViewModel, SummaryState> {
  SummaryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'summaryViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$summaryViewModelHash();

  @$internal
  @override
  SummaryViewModel create() => SummaryViewModel();
}

String _$summaryViewModelHash() => r'd3bcadb19d72f2f2bf4ac9a1b75d12e958470770';

abstract class _$SummaryViewModel extends $AsyncNotifier<SummaryState> {
  FutureOr<SummaryState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SummaryState>, SummaryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SummaryState>, SummaryState>,
              AsyncValue<SummaryState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
