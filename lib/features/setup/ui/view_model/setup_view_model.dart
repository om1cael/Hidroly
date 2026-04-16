import 'dart:developer';

import 'package:hidroly/core/ui/view_model/hydration_form_view_model.dart';
import 'package:hidroly/features/setup/domain/usecases/complete_setup_use_case.dart';
import 'package:hidroly/features/setup/ui/state/setup_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_view_model.g.dart';

@riverpod
class SetupViewModel extends _$SetupViewModel {
  @override 
  SetupState build() => SetupState();

  Future<void> completeSetup(String ageText, String weightText) async {
    if(state.stage != .idle) return;

    try {      
      final person = ref
        .read(hydrationFormViewModelProvider.notifier)
        .mapToPerson(ageText, weightText);
      
      final unitSystem = ref
        .read(hydrationFormViewModelProvider)
        .unit.first;

      state = state.copyWith(stage: .processing);
      final setupResult = await ref.read(completeSetupUseCaseProvider)
        .execute(person, unitSystem);

      state = state.copyWith(
        dailyGoalClamped: setupResult.isClamped,
        stage: .success,
      );
    } on Exception catch (e) {
      state = state.copyWith(stage: .error);
      log(e.toString(), error: e);
    }
  }
}