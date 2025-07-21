import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

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
    Locale('pt'),
  ];

  /// No description provided for @progressCircleOf.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get progressCircleOf;

  /// No description provided for @waterAddFailed.
  ///
  /// In en, this message translates to:
  /// **'Oops! Couldn\'t add your water. Try again?'**
  String get waterAddFailed;

  /// No description provided for @customCupButton.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get customCupButton;

  /// No description provided for @customCupDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Custom Cup'**
  String get customCupDialogTitle;

  /// No description provided for @customCupDialogTextFieldAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get customCupDialogTextFieldAmount;

  /// No description provided for @textFieldAmountError.
  ///
  /// In en, this message translates to:
  /// **'Invalid Amount'**
  String get textFieldAmountError;

  /// No description provided for @addAction.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addAction;

  /// No description provided for @dayLoadingFailed.
  ///
  /// In en, this message translates to:
  /// **'Day not found'**
  String get dayLoadingFailed;

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

  /// No description provided for @dayHistoryBottomSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Day history'**
  String get dayHistoryBottomSheetTitle;

  /// No description provided for @dayHistoryBottomSheetNoItems.
  ///
  /// In en, this message translates to:
  /// **'Nothing here :('**
  String get dayHistoryBottomSheetNoItems;

  /// No description provided for @dayHistoryBottomSheetItemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'added {time}'**
  String dayHistoryBottomSheetItemSubtitle(String time);

  /// No description provided for @setupWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get setupWelcomeTitle;

  /// No description provided for @setupWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We just need to set things up. It will be quick and easy!'**
  String get setupWelcomeSubtitle;

  /// No description provided for @setupDataText.
  ///
  /// In en, this message translates to:
  /// **'Your data is stored on your device.'**
  String get setupDataText;

  /// No description provided for @setupAgeTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Your age'**
  String get setupAgeTextFieldLabel;

  /// No description provided for @setupAgeTextFieldInvalidValue.
  ///
  /// In en, this message translates to:
  /// **'Age between 10 and 120'**
  String get setupAgeTextFieldInvalidValue;

  /// No description provided for @setupWeightTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Your weight'**
  String get setupWeightTextFieldLabel;

  /// No description provided for @setupWeightTextFieldInvalidValue.
  ///
  /// In en, this message translates to:
  /// **'Weight between 30 and 200'**
  String get setupWeightTextFieldInvalidValue;

  /// No description provided for @setupUnitMetric.
  ///
  /// In en, this message translates to:
  /// **'kg, ml'**
  String get setupUnitMetric;

  /// No description provided for @setupUnitImperial.
  ///
  /// In en, this message translates to:
  /// **'lb, fl oz'**
  String get setupUnitImperial;

  /// No description provided for @homePageTodayAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get homePageTodayAppBarTitle;

  /// No description provided for @mlUnit.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get mlUnit;

  /// No description provided for @flOzUnit.
  ///
  /// In en, this message translates to:
  /// **'fl oz'**
  String get flOzUnit;

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

  /// No description provided for @imperial.
  ///
  /// In en, this message translates to:
  /// **'Imperial'**
  String get imperial;

  /// No description provided for @settingsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPageTitle;

  /// No description provided for @settingsGeneralSection.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneralSection;

  /// No description provided for @settingsUnitSystem.
  ///
  /// In en, this message translates to:
  /// **'Unit system'**
  String get settingsUnitSystem;

  /// No description provided for @settingsYouSection.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get settingsYouSection;

  /// No description provided for @settingsAboutSection.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAboutSection;

  /// No description provided for @settingsUpdateYourDailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Update your daily goal'**
  String get settingsUpdateYourDailyGoal;

  /// No description provided for @settingsSetCustomDailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Set a custom daily goal'**
  String get settingsSetCustomDailyGoal;

  /// No description provided for @dailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Daily goal'**
  String get dailyGoal;

  /// No description provided for @updateAction.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateAction;

  /// No description provided for @cancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelAction;

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
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
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
