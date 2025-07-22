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
  String get textFieldAmountError => 'Invalid Amount';

  @override
  String get addAction => 'Add';

  @override
  String get dayLoadingFailed => 'Day not found';

  @override
  String get bottomNavHomeLabel => 'Home';

  @override
  String get bottomNavSummaryLabel => 'Summary';

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
  String get setupUnitMetric => 'kg, ml';

  @override
  String get setupUnitImperial => 'lb, fl oz';

  @override
  String get homePageTodayAppBarTitle => 'Today';

  @override
  String get mlUnit => 'ml';

  @override
  String get flOzUnit => 'fl oz';

  @override
  String get kgUnit => 'kg';

  @override
  String get lbUnit => 'lb';

  @override
  String get metric => 'Metric';

  @override
  String get imperial => 'Imperial';

  @override
  String get settingsPageTitle => 'Settings';

  @override
  String get settingsGeneralSection => 'General';

  @override
  String get settingsUnitSystem => 'Unit system';

  @override
  String get settingsUpdateDailyGoalAppBar => 'Update Goal';

  @override
  String get settingsUpdateDailyGoalTitle => 'Update';

  @override
  String get settingsUpdateDailyGoalDescription =>
      'Help us with a few details so we can update your goal';

  @override
  String get settingsYouSection => 'You';

  @override
  String get settingsAboutSection => 'About';

  @override
  String get settingsUpdateYourDailyGoal => 'Update your daily goal';

  @override
  String get settingsSetCustomDailyGoal => 'Set a custom daily goal';

  @override
  String get dailyGoal => 'Daily goal';

  @override
  String get updateAction => 'Update';

  @override
  String get cancelAction => 'Cancel';

  @override
  String get settingsFeedback => 'Send feedback';

  @override
  String get settingsFeedbackDescription => 'Share your thoughts with us';

  @override
  String get settingsContribute => 'Contribute';

  @override
  String get settingsContributeDescription => 'Access the GitHub repository';

  @override
  String get dailyGoalUpdated => 'Daily goal saved successfully';

  @override
  String get notificationSetupTitle => 'Notifications';

  @override
  String get notificationSetupDescription =>
      'Let\'s adjust notifications to match your day';

  @override
  String get notificationsSettingsWakeUp => 'You wake up at';

  @override
  String get notificationsSettingsSleep => 'You sleep at';

  @override
  String get reminderNotificationTitle => 'Time to drink some water';

  @override
  String get reminderNotificationBody =>
      'Keep yourself refreshed with a quick sip';
}
