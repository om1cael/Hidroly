// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get addAction => 'إضافة';

  @override
  String get cancelAction => 'إلغاء';

  @override
  String get deleteAction => 'حذف';

  @override
  String get doNotSaveLabel => 'عدم الحفظ';

  @override
  String get editAction => 'تعديل';

  @override
  String get rearrangeAction => 'إعادة ترتيب';

  @override
  String get updateAction => 'تحديث';

  @override
  String get manageAction => 'إدارة';

  @override
  String get bottomNavHomeLabel => 'الرئيسية';

  @override
  String get bottomNavSummaryLabel => 'الملخص';

  @override
  String get customCupButton => 'مخصص';

  @override
  String get customCupDialogTextFieldAmount => 'الكمية';

  @override
  String get customCupDialogTitle => 'إضافة كوب مخصص';

  @override
  String get editCustomCupDialogTitle => 'تعديل الكوب المخصص';

  @override
  String get editCustomCupFailed =>
      'لم نتمكن من تعديل الكوب. يرجى الإبلاغ عن ذلك.';

  @override
  String get editCustomCupSuccess => 'تم تعديل الكوب بنجاح!';

  @override
  String get dailyGoal => 'الهدف اليومي';

  @override
  String get dailyGoalUpdated => 'تم حفظ الهدف اليومي بنجاح';

  @override
  String dayHistoryBottomSheetItemSubtitle(String time) {
    return 'أُضيف $time';
  }

  @override
  String get dayHistoryBottomSheetNoItems => 'لا يوجد شيء هنا :(';

  @override
  String get dayHistoryBottomSheetTitle => 'سجل اليوم';

  @override
  String get dayLoadingFailed => 'لم يتم العثور على اليوم';

  @override
  String get notificationTaskCreationFailed => 'فشل إنشاء مهمة الإشعارات';

  @override
  String get pageNotAvailableDescription =>
      'عذراً، هذه الصفحة غير متاحة حالياً :(';

  @override
  String get pageNotAvailableTitle => 'غير متاح';

  @override
  String get setupFailed => 'حدث خطأ ما. يرجى المحاولة لاحقاً.';

  @override
  String get sleepScheduleEditFailed => 'تعذر حفظ جدول النوم';

  @override
  String get textFieldAmountError => 'الكمية غير صحيحة';

  @override
  String get valueNotSupported => 'القيمة غير مدعومة';

  @override
  String get waterAddFailed => 'عذراً! لم نتمكن من إضافة الماء. حاول مرة أخرى؟';

  @override
  String get homePageTodayAppBarTitle => 'اليوم';

  @override
  String get notificationSetupDescription => 'لنضبط الإشعارات لتناسب يومك';

  @override
  String get notificationSetupTitle => 'الإشعارات';

  @override
  String get notificationsSettingsSleep => 'تنام في الساعة';

  @override
  String get notificationsSettingsWakeUp => 'تستيقظ في الساعة';

  @override
  String get reminderNotificationBody =>
      'حافظ على صحة جسمك، اشرب قليلاً من الماء!';

  @override
  String get reminderNotificationTitle => '💧 وقت شرب الماء!';

  @override
  String get progressCircleOf => 'من';

  @override
  String get settingsAboutSection => 'عن التطبيق';

  @override
  String get settingsContribute => 'المساهمة';

  @override
  String get settingsContributeDescription => 'زيارة صفحة المشروع';

  @override
  String get settingsFeedback => 'إرسال ملاحظات';

  @override
  String get settingsFeedbackDescription => 'شاركنا رأيك';

  @override
  String get settingsGeneralSection => 'عام';

  @override
  String get settingsPageTitle => 'الإعدادات';

  @override
  String get settingsSetCustomDailyGoal => 'تحديد هدف يومي مخصص';

  @override
  String get settingsSleepSchedule => 'تعديل جدول النوم';

  @override
  String get settingsSleepScheduleAppBar => 'تعديل جدول النوم';

  @override
  String get settingsSleepScheduleDescription =>
      'ساعدنا ببعض التفاصيل لتحديث جدول نومك';

  @override
  String get settingsSleepScheduleTitle => 'جدول النوم';

  @override
  String get settingsUnitSystem => 'نظام الوحدات';

  @override
  String get settingsUpdateDailyGoalAppBar => 'تحديث الهدف';

  @override
  String get settingsUpdateDailyGoalDescription =>
      'ساعدنا ببعض التفاصيل لتحديث هدفك';

  @override
  String get settingsUpdateDailyGoalTitle => 'الهدف اليومي';

  @override
  String get settingsUpdateYourDailyGoal => 'تحديث هدفك اليومي';

  @override
  String get settingsYouSection => 'أنت';

  @override
  String get settingsNotificationsSection => 'الإشعارات';

  @override
  String get settingsNotificationsManageDescription => 'تفعيل/إيقاف الإشعارات';

  @override
  String get settingsNotificationsSleepScheduleDescription =>
      'أوقات النوم والاستيقاظ والتكرار';

  @override
  String get settingsNotificationsFrequency => 'التكرار';

  @override
  String get settingsTheme => 'المظهر';

  @override
  String get settingsHapticFeedback => 'الاهتزاز عند اللمس';

  @override
  String get setupAgeTextFieldInvalidValue => 'العمر بين 10 و 120';

  @override
  String get setupAgeTextFieldLabel => 'عمرك';

  @override
  String get setupDataText => 'بياناتك محفوظة على جهازك.';

  @override
  String get setupUnitImperial => 'رطل، أونصة';

  @override
  String get setupUnitMetric => 'كجم، مل';

  @override
  String setupWeightTextFieldInvalidWeight(String minWeight, String maxWeight) {
    return 'الوزن بين $minWeight و $maxWeight';
  }

  @override
  String get setupWeightTextFieldLabel => 'وزنك';

  @override
  String get setupWelcomeSubtitle =>
      'نحتاج فقط لضبط بعض الإعدادات. سيكون الأمر سريعاً وسهلاً!';

  @override
  String get setupWelcomeTitle => 'أهلاً بك';

  @override
  String get flOzUnit => 'أونصة';

  @override
  String get imperial => 'إمبراطوري';

  @override
  String get kgUnit => 'كجم';

  @override
  String get lbUnit => 'رطل';

  @override
  String get metric => 'متري';

  @override
  String get mlUnit => 'مل';

  @override
  String minutes(String time) {
    return '$time دقيقة';
  }

  @override
  String hour(String time) {
    return '$time ساعة';
  }

  @override
  String hours(String time) {
    return '$time ساعات';
  }

  @override
  String get globalStatisticsTitle => 'الإحصائيات العامة';

  @override
  String get globalStatisticsNoDataDescription => 'ستظهر بياناتك هنا قريباً!';

  @override
  String get currentStreakStat => 'الالتزام الحالي';

  @override
  String get bestStreakStat => 'أفضل التزام';

  @override
  String get totalIntakeStat => 'مجموع الشرب';

  @override
  String get averageIntakeStat => 'المعدل';

  @override
  String get day => 'يوم';

  @override
  String get days => 'أيام';

  @override
  String get weeklyIntakeTitle => 'الشرب الأسبوعي';

  @override
  String get weeklyIntakeNoData =>
      'نعمل على تجهيز الرسم البياني الأسبوعي. عد قريباً لرؤيته!';

  @override
  String get system => 'النظام';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'داكن';

  @override
  String get historyIconSemanticLabel => 'السجل';

  @override
  String get settingsIconSemanticLabel => 'الإعدادات';

  @override
  String get addCupIconSemanticLabel => 'إضافة كوب';

  @override
  String get saveChangesIconSemanticLabel => 'حفظ التغييرات';

  @override
  String get goBackIconSemanticLabel => 'رجوع';

  @override
  String waterRemoveIconSemanticLabel(String amount) {
    return 'إزالة $amount';
  }
}
