// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_connect_settings_card_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HealthConnectSettingsCardViewModel)
final healthConnectSettingsCardViewModelProvider =
    HealthConnectSettingsCardViewModelProvider._();

final class HealthConnectSettingsCardViewModelProvider
    extends
        $AsyncNotifierProvider<
          HealthConnectSettingsCardViewModel,
          HealthConnectSettingsState
        > {
  HealthConnectSettingsCardViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'healthConnectSettingsCardViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$healthConnectSettingsCardViewModelHash();

  @$internal
  @override
  HealthConnectSettingsCardViewModel create() =>
      HealthConnectSettingsCardViewModel();
}

String _$healthConnectSettingsCardViewModelHash() =>
    r'eab760462b80080c4f648b4ecb9c1c52fe4270e0';

abstract class _$HealthConnectSettingsCardViewModel
    extends $AsyncNotifier<HealthConnectSettingsState> {
  FutureOr<HealthConnectSettingsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<HealthConnectSettingsState>,
              HealthConnectSettingsState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<HealthConnectSettingsState>,
                HealthConnectSettingsState
              >,
              AsyncValue<HealthConnectSettingsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
