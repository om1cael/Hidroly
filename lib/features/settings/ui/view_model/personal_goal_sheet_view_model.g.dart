// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_goal_sheet_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PersonalGoalSheetViewModel)
final personalGoalSheetViewModelProvider =
    PersonalGoalSheetViewModelProvider._();

final class PersonalGoalSheetViewModelProvider
    extends
        $AsyncNotifierProvider<
          PersonalGoalSheetViewModel,
          PersonalGoalSheetState
        > {
  PersonalGoalSheetViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personalGoalSheetViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personalGoalSheetViewModelHash();

  @$internal
  @override
  PersonalGoalSheetViewModel create() => PersonalGoalSheetViewModel();
}

String _$personalGoalSheetViewModelHash() =>
    r'38d4d27d3ab9f51e9344c3c6a65393798e90c513';

abstract class _$PersonalGoalSheetViewModel
    extends $AsyncNotifier<PersonalGoalSheetState> {
  FutureOr<PersonalGoalSheetState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<PersonalGoalSheetState>, PersonalGoalSheetState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PersonalGoalSheetState>,
                PersonalGoalSheetState
              >,
              AsyncValue<PersonalGoalSheetState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
