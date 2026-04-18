// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_system_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UnitSystemProvider)
final unitSystemProviderProvider = UnitSystemProviderProvider._();

final class UnitSystemProviderProvider
    extends $AsyncNotifierProvider<UnitSystemProvider, UnitSystem> {
  UnitSystemProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unitSystemProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unitSystemProviderHash();

  @$internal
  @override
  UnitSystemProvider create() => UnitSystemProvider();
}

String _$unitSystemProviderHash() =>
    r'6fb5d11a2aec9c38d08fe70e915cecc1146b378d';

abstract class _$UnitSystemProvider extends $AsyncNotifier<UnitSystem> {
  FutureOr<UnitSystem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UnitSystem>, UnitSystem>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UnitSystem>, UnitSystem>,
              AsyncValue<UnitSystem>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
