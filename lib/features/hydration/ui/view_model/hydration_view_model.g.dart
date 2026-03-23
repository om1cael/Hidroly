// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydration_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HydrationViewModel)
final hydrationViewModelProvider = HydrationViewModelProvider._();

final class HydrationViewModelProvider
    extends $AsyncNotifierProvider<HydrationViewModel, HydrationState> {
  HydrationViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hydrationViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hydrationViewModelHash();

  @$internal
  @override
  HydrationViewModel create() => HydrationViewModel();
}

String _$hydrationViewModelHash() =>
    r'7377db17ed9b9f0b2935ab7d25e3911f82e9cfba';

abstract class _$HydrationViewModel extends $AsyncNotifier<HydrationState> {
  FutureOr<HydrationState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HydrationState>, HydrationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HydrationState>, HydrationState>,
              AsyncValue<HydrationState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
