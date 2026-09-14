// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_connect_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(healthConnectService)
final healthConnectServiceProvider = HealthConnectServiceProvider._();

final class HealthConnectServiceProvider
    extends
        $FunctionalProvider<
          AggregateHealthService,
          AggregateHealthService,
          AggregateHealthService
        >
    with $Provider<AggregateHealthService> {
  HealthConnectServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'healthConnectServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$healthConnectServiceHash();

  @$internal
  @override
  $ProviderElement<AggregateHealthService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AggregateHealthService create(Ref ref) {
    return healthConnectService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AggregateHealthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AggregateHealthService>(value),
    );
  }
}

String _$healthConnectServiceHash() =>
    r'495ce9243c70d15157c5850b4a41fe1bb3233f02';
