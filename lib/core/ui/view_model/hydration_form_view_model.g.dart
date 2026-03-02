// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydration_form_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HydrationFormViewModel)
final hydrationFormViewModelProvider = HydrationFormViewModelProvider._();

final class HydrationFormViewModelProvider
    extends $NotifierProvider<HydrationFormViewModel, HydrationFormState> {
  HydrationFormViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hydrationFormViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hydrationFormViewModelHash();

  @$internal
  @override
  HydrationFormViewModel create() => HydrationFormViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HydrationFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HydrationFormState>(value),
    );
  }
}

String _$hydrationFormViewModelHash() =>
    r'da2951e801e9e625522c6166e60a2ae19b082b10';

abstract class _$HydrationFormViewModel extends $Notifier<HydrationFormState> {
  HydrationFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<HydrationFormState, HydrationFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HydrationFormState, HydrationFormState>,
              HydrationFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
