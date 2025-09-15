// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get addAction => 'Add';

  @override
  String get cancelAction => 'Cancel';

  @override
  String get deleteAction => 'Delete';

  @override
  String get doNotSaveLabel => 'Do not save';

  @override
  String get editAction => 'Edit';

  @override
  String get rearrangeAction => 'Rearrange';

  @override
  String get updateAction => 'Update';

  @override
  String get manageAction => 'Manage';

  @override
  String get bottomNavHomeLabel => 'Home';

  @override
  String get bottomNavSummaryLabel => 'Summary';

  @override
  String get customCupButton => 'Custom';

  @override
  String get customCupDialogTextFieldAmount => 'Amount';

  @override
  String get customCupDialogTitle => 'Add Custom Cup';

  @override
  String get editCustomCupDialogTitle => 'Edit custom cup';

  @override
  String get editCustomCupFailed =>
      'It was not possible to edit your cup. Please, report it on GitHub and reference code \'ECE01\'.';

  @override
  String get editCustomCupSuccess => 'Cup edited successfully!';

  @override
  String get dailyGoal => 'Daily goal';

  @override
  String get dailyGoalUpdated => 'Daily goal saved successfully';

  @override
  String dayHistoryBottomSheetItemSubtitle(String time) {
    return 'added $time';
  }

  @override
  String get dayHistoryBottomSheetNoItems => 'Nothing here :(';

  @override
  String get dayHistoryBottomSheetTitle => 'Day history';

  @override
  String get dayLoadingFailed => 'Day not found';

  @override
  String get notificationTaskCreationFailed =>
      'Failed to create the notification task';

  @override
  String get pageNotAvailableDescription =>
      'Sorry, this page isn\'t available yet :(';

  @override
  String get pageNotAvailableTitle => 'Not Available';

  @override
  String get setupFailed =>
      'An error occurred. Please create a GitHub issue and reference code \'SE01\'.';

  @override
  String get sleepScheduleEditFailed => 'Could not save your sleep schedule';

  @override
  String get textFieldAmountError => 'Invalid Amount';

  @override
  String get valueNotSupported => 'Value not supported';

  @override
  String get waterAddFailed => 'Oops! Couldn\'t add your water. Try again?';

  @override
  String get homePageTodayAppBarTitle => 'Today';

  @override
  String get notificationSetupDescription =>
      'Let\'s adjust notifications to match your day';

  @override
  String get notificationSetupTitle => 'Notifications';

  @override
  String get notificationsSettingsSleep => 'You sleep at';

  @override
  String get notificationsSettingsWakeUp => 'You wake up at';

  @override
  String get reminderNotificationBody => 'Keep your body happy, take a sip!';

  @override
  String get reminderNotificationTitle => '💧 Time to hydrate!';

  @override
  String get progressCircleOf => 'of';

  @override
  String get settingsAboutSection => 'About';

  @override
  String get settingsContribute => 'Contribute';

  @override
  String get settingsContributeDescription => 'Access the GitHub repository';

  @override
  String get settingsFeedback => 'Send feedback';

  @override
  String get settingsFeedbackDescription => 'Share your thoughts with us';

  @override
  String get settingsGeneralSection => 'General';

  @override
  String get settingsPageTitle => 'Settings';

  @override
  String get settingsSetCustomDailyGoal => 'Set a custom daily goal';

  @override
  String get settingsSleepSchedule => 'Edit sleep schedule';

  @override
  String get settingsSleepScheduleAppBar => 'Edit sleep schedule';

  @override
  String get settingsSleepScheduleDescription =>
      'Help us with a few details so we can update your sleep schedule';

  @override
  String get settingsSleepScheduleTitle => 'Sleep Schedule';

  @override
  String get settingsUnitSystem => 'Unit system';

  @override
  String get settingsUpdateDailyGoalAppBar => 'Update Goal';

  @override
  String get settingsUpdateDailyGoalDescription =>
      'Help us with a few details so we can update your goal';

  @override
  String get settingsUpdateDailyGoalTitle => 'Daily Goal';

  @override
  String get settingsUpdateYourDailyGoal => 'Update your daily goal';

  @override
  String get settingsYouSection => 'You';

  @override
  String get settingsNotificationsSection => 'Notifications';

  @override
  String get settingsNotificationsManageDescription => 'Toggle notifications';

  @override
  String get settingsNotificationsSleepScheduleDescription =>
      'Wake/sleep times & frequency';

  @override
  String get settingsNotificationsFrequency => 'Frequency';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsHapticFeedback => 'Haptic Feedback';

  @override
  String get setupAgeTextFieldInvalidValue => 'Age between 10 and 120';

  @override
  String get setupAgeTextFieldLabel => 'Your age';

  @override
  String get setupDataText => 'Your data is stored on your device.';

  @override
  String get setupUnitImperial => 'lb, fl oz';

  @override
  String get setupUnitMetric => 'kg, ml';

  @override
  String setupWeightTextFieldInvalidWeight(String minWeight, String maxWeight) {
    return 'Weight between $minWeight and $maxWeight';
  }

  @override
  String get setupWeightTextFieldLabel => 'Your weight';

  @override
  String get setupWelcomeSubtitle =>
      'We just need to set things up. It will be quick and easy!';

  @override
  String get setupWelcomeTitle => 'Welcome';

  @override
  String get flOzUnit => 'fl oz';

  @override
  String get imperial => 'Imperial';

  @override
  String get kgUnit => 'kg';

  @override
  String get lbUnit => 'lb';

  @override
  String get metric => 'Metric';

  @override
  String get mlUnit => 'ml';

  @override
  String minutes(String time) {
    return '$time minutes';
  }

  @override
  String hour(String time) {
    return '$time hour';
  }

  @override
  String hours(String time) {
    return '$time hours';
  }

  @override
  String get globalStatisticsTitle => 'Global Statistics';

  @override
  String get globalStatisticsNoDataDescription =>
      'Your data will appear here soon!';

  @override
  String get currentStreakStat => 'Current Streak';

  @override
  String get bestStreakStat => 'Best Streak';

  @override
  String get totalIntakeStat => 'Total Intake';

  @override
  String get averageIntakeStat => 'Avg. Intake';

  @override
  String get day => 'day';

  @override
  String get days => 'days';

  @override
  String get weeklyIntakeTitle => 'Weekly Intake';

  @override
  String get weeklyIntakeNoData =>
      'We\'re still working on your weekly intake chart. Come back soon to see it!';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get historyIconSemanticLabel => 'History';

  @override
  String get settingsIconSemanticLabel => 'Settings';

  @override
  String get addCupIconSemanticLabel => 'Add cup';

  @override
  String get saveChangesIconSemanticLabel => 'Save changes';

  @override
  String get goBackIconSemanticLabel => 'Go back';

  @override
  String waterRemoveIconSemanticLabel(String amount) {
    return 'Remove $amount';
  }
}
