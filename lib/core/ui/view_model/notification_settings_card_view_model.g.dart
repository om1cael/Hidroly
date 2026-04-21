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
        $AsyncNotifierProvider<
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
}

String _$notificationSettingsCardViewModelHash() =>
    r'fc274ea620a5ebeb6f5e7f2e1d383a2ce0528323';

abstract class _$NotificationSettingsCardViewModel
    extends $AsyncNotifier<NotificationSettingsState> {
  FutureOr<NotificationSettingsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<NotificationSettingsState>,
              NotificationSettingsState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<NotificationSettingsState>,
                NotificationSettingsState
              >,
              AsyncValue<NotificationSettingsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
