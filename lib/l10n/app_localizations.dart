import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('de'),
    Locale('pt'),
  ];

  /// No description provided for @addAction.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addAction;

  /// No description provided for @cancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelAction;

  /// No description provided for @deleteAction.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteAction;

  /// No description provided for @doNotSaveLabel.
  ///
  /// In en, this message translates to:
  /// **'Do not save'**
  String get doNotSaveLabel;

  /// No description provided for @editAction.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editAction;

  /// No description provided for @rearrangeAction.
  ///
  /// In en, this message translates to:
  /// **'Rearrange'**
  String get rearrangeAction;

  /// No description provided for @updateAction.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateAction;

  /// No description provided for @manageAction.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manageAction;

  /// No description provided for @bottomNavHomeLabel.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavHomeLabel;

  /// No description provided for @bottomNavSummaryLabel.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get bottomNavSummaryLabel;

  /// No description provided for @customCupButton.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get customCupButton;

  /// No description provided for @customCupDialogTextFieldAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get customCupDialogTextFieldAmount;

  /// No description provided for @customCupDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Custom Cup'**
  String get customCupDialogTitle;

  /// No description provided for @editCustomCupDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit custom cup'**
  String get editCustomCupDialogTitle;

  /// No description provided for @editCustomCupFailed.
  ///
  /// In en, this message translates to:
  /// **'It was not possible to edit your cup. Please, report it on GitHub and reference code \'ECE01\'.'**
  String get editCustomCupFailed;

  /// No description provided for @editCustomCupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Cup edited successfully!'**
  String get editCustomCupSuccess;

  /// No description provided for @dailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Daily goal'**
  String get dailyGoal;

  /// No description provided for @dailyGoalUpdated.
  ///
  /// In en, this message translates to:
  /// **'Daily goal saved successfully'**
  String get dailyGoalUpdated;

  /// No description provided for @dayHistoryBottomSheetItemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'added {time}'**
  String dayHistoryBottomSheetItemSubtitle(String time);

  /// No description provided for @dayHistoryBottomSheetNoItems.
  ///
  /// In en, this message translates to:
  /// **'Nothing here :('**
  String get dayHistoryBottomSheetNoItems;

  /// No description provided for @dayHistoryBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Day history'**
  String get dayHistoryBottomSheetTitle;

  /// No description provided for @dayLoadingFailed.
  ///
  /// In en, this message translates to:
  /// **'Day not found'**
  String get dayLoadingFailed;

  /// No description provided for @notificationTaskCreationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create the notification task'**
  String get notificationTaskCreationFailed;

  /// No description provided for @pageNotAvailableDescription.
  ///
  /// In en, this message translates to:
  /// **'Sorry, this page isn\'t available yet :('**
  String get pageNotAvailableDescription;

  /// No description provided for @pageNotAvailableTitle.
  ///
  /// In en, this message translates to:
  /// **'Not Available'**
  String get pageNotAvailableTitle;

  /// No description provided for @setupFailed.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please create a GitHub issue and reference code \'SE01\'.'**
  String get setupFailed;

  /// No description provided for @sleepScheduleEditFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save your sleep schedule'**
  String get sleepScheduleEditFailed;

  /// No description provided for @textFieldAmountError.
  ///
  /// In en, this message translates to:
  /// **'Invalid Amount'**
  String get textFieldAmountError;

  /// No description provided for @valueNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Value not supported'**
  String get valueNotSupported;

  /// No description provided for @waterAddFailed.
  ///
  /// In en, this message translates to:
  /// **'Oops! Couldn\'t add your water. Try again?'**
  String get waterAddFailed;

  /// No description provided for @homePageTodayAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get homePageTodayAppBarTitle;

  /// No description provided for @notificationSetupDescription.
  ///
  /// In en, this message translates to:
  /// **'Let\'s adjust notifications to match your day'**
  String get notificationSetupDescription;

  /// No description provided for @notificationSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationSetupTitle;

  /// No description provided for @notificationsSettingsSleep.
  ///
  /// In en, this message translates to:
  /// **'You sleep at'**
  String get notificationsSettingsSleep;

  /// No description provided for @notificationsSettingsWakeUp.
  ///
  /// In en, this message translates to:
  /// **'You wake up at'**
  String get notificationsSettingsWakeUp;

  /// No description provided for @reminderNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Keep your body happy, take a sip!'**
  String get reminderNotificationBody;

  /// No description provided for @reminderNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'💧 Time to hydrate!'**
  String get reminderNotificationTitle;

  /// No description provided for @progressCircleOf.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get progressCircleOf;

  /// No description provided for @settingsAboutSection.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAboutSection;

  /// No description provided for @settingsContribute.
  ///
  /// In en, this message translates to:
  /// **'Contribute'**
  String get settingsContribute;

  /// No description provided for @settingsContributeDescription.
  ///
  /// In en, this message translates to:
  /// **'Access the GitHub repository'**
  String get settingsContributeDescription;

  /// No description provided for @settingsFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send feedback'**
  String get settingsFeedback;

  /// No description provided for @settingsFeedbackDescription.
  ///
  /// In en, this message translates to:
  /// **'Share your thoughts with us'**
  String get settingsFeedbackDescription;

  /// No description provided for @settingsGeneralSection.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneralSection;

  /// No description provided for @settingsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPageTitle;

  /// No description provided for @settingsSetCustomDailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Set a custom daily goal'**
  String get settingsSetCustomDailyGoal;

  /// No description provided for @settingsSleepSchedule.
  ///
  /// In en, this message translates to:
  /// **'Edit sleep schedule'**
  String get settingsSleepSchedule;

  /// No description provided for @settingsSleepScheduleAppBar.
  ///
  /// In en, this message translates to:
  /// **'Edit sleep schedule'**
  String get settingsSleepScheduleAppBar;

  /// No description provided for @settingsSleepScheduleDescription.
  ///
  /// In en, this message translates to:
  /// **'Help us with a few details so we can update your sleep schedule'**
  String get settingsSleepScheduleDescription;

  /// No description provided for @settingsSleepScheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Sleep Schedule'**
  String get settingsSleepScheduleTitle;

  /// No description provided for @settingsUnitSystem.
  ///
  /// In en, this message translates to:
  /// **'Unit system'**
  String get settingsUnitSystem;

  /// No description provided for @settingsUpdateDailyGoalAppBar.
  ///
  /// In en, this message translates to:
  /// **'Update Goal'**
  String get settingsUpdateDailyGoalAppBar;

  /// No description provided for @settingsUpdateDailyGoalDescription.
  ///
  /// In en, this message translates to:
  /// **'Help us with a few details so we can update your goal'**
  String get settingsUpdateDailyGoalDescription;

  /// No description provided for @settingsUpdateDailyGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Goal'**
  String get settingsUpdateDailyGoalTitle;

  /// No description provided for @settingsUpdateYourDailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Update your daily goal'**
  String get settingsUpdateYourDailyGoal;

  /// No description provided for @settingsYouSection.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get settingsYouSection;

  /// No description provided for @settingsNotificationsSection.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotificationsSection;

  /// No description provided for @settingsNotificationsManageDescription.
  ///
  /// In en, this message translates to:
  /// **'Toggle notifications'**
  String get settingsNotificationsManageDescription;

  /// No description provided for @settingsNotificationsSleepScheduleDescription.
  ///
  /// In en, this message translates to:
  /// **'Wake/sleep times & frequency'**
  String get settingsNotificationsSleepScheduleDescription;

  /// No description provided for @settingsNotificationsFrequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get settingsNotificationsFrequency;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsHapticFeedback.
  ///
  /// In en, this message translates to:
  /// **'Haptic Feedback'**
  String get settingsHapticFeedback;

  /// No description provided for @setupAgeTextFieldInvalidValue.
  ///
  /// In en, this message translates to:
  /// **'Age between 10 and 120'**
  String get setupAgeTextFieldInvalidValue;

  /// No description provided for @setupAgeTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Your age'**
  String get setupAgeTextFieldLabel;

  /// No description provided for @setupDataText.
  ///
  /// In en, this message translates to:
  /// **'Your data is stored on your device.'**
  String get setupDataText;

  /// No description provided for @setupUnitImperial.
  ///
  /// In en, this message translates to:
  /// **'lb, fl oz'**
  String get setupUnitImperial;

  /// No description provided for @setupUnitMetric.
  ///
  /// In en, this message translates to:
  /// **'kg, ml'**
  String get setupUnitMetric;

  /// No description provided for @setupWeightTextFieldInvalidWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight between {minWeight} and {maxWeight}'**
  String setupWeightTextFieldInvalidWeight(String minWeight, String maxWeight);

  /// No description provided for @setupWeightTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Your weight'**
  String get setupWeightTextFieldLabel;

  /// No description provided for @setupWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We just need to set things up. It will be quick and easy!'**
  String get setupWelcomeSubtitle;

  /// No description provided for @setupWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get setupWelcomeTitle;

  /// No description provided for @flOzUnit.
  ///
  /// In en, this message translates to:
  /// **'fl oz'**
  String get flOzUnit;

  /// No description provided for @imperial.
  ///
  /// In en, this message translates to:
  /// **'Imperial'**
  String get imperial;

  /// No description provided for @kgUnit.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kgUnit;

  /// No description provided for @lbUnit.
  ///
  /// In en, this message translates to:
  /// **'lb'**
  String get lbUnit;

  /// No description provided for @metric.
  ///
  /// In en, this message translates to:
  /// **'Metric'**
  String get metric;

  /// No description provided for @mlUnit.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get mlUnit;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'{time} minutes'**
  String minutes(String time);

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'{time} hour'**
  String hour(String time);

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'{time} hours'**
  String hours(String time);

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @historyIconSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyIconSemanticLabel;

  /// No description provided for @settingsIconSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsIconSemanticLabel;

  /// No description provided for @addCupIconSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Add cup'**
  String get addCupIconSemanticLabel;

  /// No description provided for @saveChangesIconSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChangesIconSemanticLabel;

  /// No description provided for @goBackIconSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBackIconSemanticLabel;

  /// No description provided for @waterRemoveIconSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Remove {amount}'**
  String waterRemoveIconSemanticLabel(String amount);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
