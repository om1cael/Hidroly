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

String _$summaryViewModelHash() => r'4eb6c0374791f2f47de5bc032c8f39be1f12cd2b';

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
