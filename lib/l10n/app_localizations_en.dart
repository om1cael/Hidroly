// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get progressCircleOf => 'of';

  @override
  String get waterAddFailed => 'Oops! Couldn\'t add your water. Try again?';

  @override
  String get customCupButton => 'Custom';

  @override
  String get customCupDialogTitle => 'Add Custom Cup';

  @override
  String get customCupDialogTextFieldAmount => 'Amount';

  @override
  String get customCupDialogTextFieldAmountError => 'Invalid Amount';

  @override
  String get customCupDialogAddButton => 'Add';

  @override
  String get customCupDialogCancelButton => 'Cancel';

  @override
  String get dayLoadingFailed => 'Day not found';

  @override
  String get bottomNavHomeLabel => 'Home';

  @override
  String get bottomNavHistoryLabel => 'History';

  @override
  String get dayHistoryBottomSheetTitle => 'Day history';

  @override
  String get dayHistoryBottomSheetNoItems => 'Nothing here :(';

  @override
  String dayHistoryBottomSheetItemSubtitle(String time) {
    return 'added $time';
  }

  @override
  String get setupWelcomeTitle => 'Welcome';

  @override
  String get setupWelcomeSubtitle =>
      'We just need to set things up. It will be quick and easy!';

  @override
  String get setupDataText => 'Your data is stored on your device.';

  @override
  String get setupAgeTextFieldLabel => 'Your age';

  @override
  String get setupAgeTextFieldInvalidValue => 'Age between 10 and 120';

  @override
  String get setupWeightTextFieldLabel => 'Your weight';

  @override
  String get setupWeightTextFieldInvalidValue => 'Weight between 30 and 200';

  @override
  String get homePageTodayAppBarTitle => 'Today';
}
