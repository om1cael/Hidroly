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
    r'5451d873e77501ea5ebb6f6238f68f895edda5a3';

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
