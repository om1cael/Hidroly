// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings_card_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationSettingsCardViewModel)
final notificationSettingsCardViewModelProvider =
    NotificationSettingsCardViewModelProvider._();

final class NotificationSettingsCardViewModelProvider
    extends
        $NotifierProvider<
          NotificationSettingsCardViewModel,
          NotificationSettingsState
        > {
  NotificationSettingsCardViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationSettingsCardViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$notificationSettingsCardViewModelHash();

  @$internal
  @override
  NotificationSettingsCardViewModel create() =>
      NotificationSettingsCardViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationSettingsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationSettingsState>(value),
    );
  }
}

String _$notificationSettingsCardViewModelHash() =>
    r'fa03e750bffdcffc5b32fb4da78273f976cfff26';

abstract class _$NotificationSettingsCardViewModel
    extends $Notifier<NotificationSettingsState> {
  NotificationSettingsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<NotificationSettingsState, NotificationSettingsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NotificationSettingsState, NotificationSettingsState>,
              NotificationSettingsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
