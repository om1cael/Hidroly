// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get addAction => 'Hinzufügen';

  @override
  String get cancelAction => 'Abbrechen';

  @override
  String get deleteAction => 'Löschen';

  @override
  String get doNotSaveLabel => 'Nicht speichern';

  @override
  String get editAction => 'Bearbeiten';

  @override
  String get rearrangeAction => 'Rearrange';

  @override
  String get updateAction => 'Aktualisieren';

  @override
  String get manageAction => 'Verwalten';

  @override
  String get bottomNavHomeLabel => 'Start';

  @override
  String get bottomNavSummaryLabel => 'Übersicht';

  @override
  String get customCupButton => 'Benutzerdefiniert';

  @override
  String get customCupDialogTextFieldAmount => 'Menge';

  @override
  String get customCupDialogTitle => 'Benutzerdefiniertes Glas Hinzufügen';

  @override
  String get editCustomCupDialogTitle => 'Benutzerdefiniertes Glas bearbeiten';

  @override
  String get editCustomCupFailed =>
      'Es war nicht möglich dieses Glas zu bearbeiten. Bitte melde dies auf GitHub und referenziere den Code \'ECE01\'.';

  @override
  String get editCustomCupSuccess => 'Glas erfolgreich bearbeitet!';

  @override
  String get dailyGoal => 'Tagesziel';

  @override
  String get dailyGoalUpdated => 'Tagesziel erfolgreich gespeichert';

  @override
  String dayHistoryBottomSheetItemSubtitle(String time) {
    return 'hinzugefügt um ${time}Uhr';
  }

  @override
  String get dayHistoryBottomSheetNoItems => 'Hier ist nichts :(';

  @override
  String get dayHistoryBottomSheetTitle => 'Tagesverlauf';

  @override
  String get dayLoadingFailed => 'Tag nicht gefunden';

  @override
  String get notificationTaskCreationFailed =>
      'Beim erstellen der Benachrichtungsaufgabe ist ein Fehler aufgetreten';

  @override
  String get pageNotAvailableDescription =>
      'Entschuldigung, diese Seite ist noch nicht verfügbar :(';

  @override
  String get pageNotAvailableTitle => 'Nicht verfügbar';

  @override
  String get setupFailed =>
      'Ein Fehler ist aufgetreten. Bitte erstelle einen GitHub issue und referenziere den Code \'SE01\'.';

  @override
  String get sleepScheduleEditFailed =>
      'Schlafplan konnte nicht gespeichert werden';

  @override
  String get textFieldAmountError => 'Ungültige Menge';

  @override
  String get valueNotSupported => 'Wert nicht unterstützt';

  @override
  String get waterAddFailed =>
      'Hoppla! Das Wasser konnte nicht hinzugefügt werden. Nochmal versuchen?';

  @override
  String get homePageTodayAppBarTitle => 'Heute';

  @override
  String get notificationSetupDescription =>
      'Lass uns die Benachrichtigungen an deinen Tag anpassen';

  @override
  String get notificationSetupTitle => 'Benachrichtigungen';

  @override
  String get notificationsSettingsSleep => 'Du schläfst ein um';

  @override
  String get notificationsSettingsWakeUp => 'Du wachst auf um';

  @override
  String get reminderNotificationBody =>
      'Mache deinen Körper glücklich, trink einen Schluck!';

  @override
  String get reminderNotificationTitle => '💧 Zeit etwas zu trinken!';

  @override
  String get progressCircleOf => 'von';

  @override
  String get settingsAboutSection => 'Über';

  @override
  String get settingsContribute => 'Beitragen';

  @override
  String get settingsContributeDescription => 'GitHub repository öffnen';

  @override
  String get settingsFeedback => 'Feedback geben';

  @override
  String get settingsFeedbackDescription => 'Teile uns deine Meinung mit';

  @override
  String get settingsGeneralSection => 'Allgemein';

  @override
  String get settingsPageTitle => 'Einstellungen';

  @override
  String get settingsSetCustomDailyGoal =>
      'Benutzerdefiniertes Tagesziel setzen';

  @override
  String get settingsSleepSchedule => 'Schlafplan bearbeiten';

  @override
  String get settingsSleepScheduleAppBar => 'Schlafplan bearbeiten';

  @override
  String get settingsSleepScheduleDescription =>
      'Hilf uns mit ein paar Details, damit wir deinen Schlafplan aktualisieren können';

  @override
  String get settingsSleepScheduleTitle => 'Schlafplan';

  @override
  String get settingsUnitSystem => 'Einheitensystem';

  @override
  String get settingsUpdateDailyGoalAppBar => 'Tagesziel aktualisieren';

  @override
  String get settingsUpdateDailyGoalDescription =>
      'Hilf uns mit ein paar Details, damit wir dein Tagesziel zu aktualisieren können';

  @override
  String get settingsUpdateDailyGoalTitle => 'Tagesziel';

  @override
  String get settingsUpdateYourDailyGoal => 'Tagesziel aktualisieren';

  @override
  String get settingsYouSection => 'Du';

  @override
  String get settingsNotificationsSection => 'Benachrichtigungen';

  @override
  String get settingsNotificationsManageDescription =>
      'Benachrichtigungen umschalten';

  @override
  String get settingsNotificationsSleepScheduleDescription =>
      'Weck-/Schlafzeiten & Regelmäßigkeit';

  @override
  String get settingsNotificationsFrequency => 'Regelmäßigkeit';

  @override
  String get settingsTheme => 'Aussehen';

  @override
  String get settingsHapticFeedback => 'Haptic Feedback';

  @override
  String get setupAgeTextFieldInvalidValue => 'Alter zwischen 10 und 120';

  @override
  String get setupAgeTextFieldLabel => 'Dein Alter';

  @override
  String get setupDataText =>
      'Deine Daten werden auf deinem Gerät gespeichert.';

  @override
  String get setupUnitImperial => 'lb, fl oz';

  @override
  String get setupUnitMetric => 'kg, ml';

  @override
  String setupWeightTextFieldInvalidWeight(String minWeight, String maxWeight) {
    return 'Gewicht zwischen $minWeight und $maxWeight';
  }

  @override
  String get setupWeightTextFieldLabel => 'Dein Gewicht';

  @override
  String get setupWelcomeSubtitle =>
      'Wir müssen nur noch ein paar Einstellungen vornehmen. Das wird schnell und einfach gehen!';

  @override
  String get setupWelcomeTitle => 'Willkommen';

  @override
  String get flOzUnit => 'fl oz';

  @override
  String get imperial => 'Imperial';

  @override
  String get kgUnit => 'kg';

  @override
  String get lbUnit => 'lb';

  @override
  String get metric => 'Metrisch';

  @override
  String get mlUnit => 'ml';

  @override
  String minutes(String time) {
    return '$time Minuten';
  }

  @override
  String hour(String time) {
    return 'Stunde $time';
  }

  @override
  String hours(String time) {
    return '$time Stunden';
  }

  @override
  String get system => 'System';

  @override
  String get light => 'Hell';

  @override
  String get dark => 'Dunkel';

  @override
  String get historyIconSemanticLabel => 'History';

  @override
  String get settingsIconSemanticLabel => 'Settings';

  @override
  String get addCupIconSemanticLabel => 'Add cup';

  @override
  String get saveChangesIconSemanticLabel => 'Save changes';

  @override
  String waterRemoveIconSemanticLabel(String amount) {
    return 'Remove $amount';
  }
}
