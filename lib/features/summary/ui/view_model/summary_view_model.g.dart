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

String _$summaryViewModelHash() => r'73dce19b88850243b64e53f916e7c925cc516be1';

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
