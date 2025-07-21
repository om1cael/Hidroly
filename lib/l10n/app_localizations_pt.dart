// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get progressCircleOf => 'de';

  @override
  String get waterAddFailed =>
      'Ops! Não foi possível adicionar sua água. Tentar novamente?';

  @override
  String get customCupButton => 'Personalizado';

  @override
  String get customCupDialogTitle => 'Adicionar Copo Personalizado';

  @override
  String get customCupDialogTextFieldAmount => 'Quantidade';

  @override
  String get customCupDialogTextFieldAmountError => 'Quantidade inválida';

  @override
  String get customCupDialogAddButton => 'Adicionar';

  @override
  String get customCupDialogCancelButton => 'Cancelar';

  @override
  String get dayLoadingFailed => 'Dia não encontrado';

  @override
  String get bottomNavHomeLabel => 'Home';

  @override
  String get bottomNavSummaryLabel => 'Resumo';

  @override
  String get dayHistoryBottomSheetTitle => 'Histórico do dia';

  @override
  String get dayHistoryBottomSheetNoItems => 'Nada por aqui :(';

  @override
  String dayHistoryBottomSheetItemSubtitle(String time) {
    return 'adicionado às $time';
  }

  @override
  String get setupWelcomeTitle => 'Bem-vindo';

  @override
  String get setupWelcomeSubtitle =>
      'Só precisamos configurar algumas coisas. Vai ser rápido e fácil!';

  @override
  String get setupDataText => 'Seus dados são armazenados no seu dispositivo.';

  @override
  String get setupAgeTextFieldLabel => 'Sua idade';

  @override
  String get setupAgeTextFieldInvalidValue => 'Idade entre 10 e 120';

  @override
  String get setupWeightTextFieldLabel => 'Seu peso';

  @override
  String get setupWeightTextFieldInvalidValue => 'Peso entre 30 e 200';

  @override
  String get setupUnitMetric => 'kg, ml';

  @override
  String get setupUnitImperial => 'lb, fl oz';

  @override
  String get homePageTodayAppBarTitle => 'Hoje';

  @override
  String get mlUnit => 'ml';

  @override
  String get flOzUnit => 'fl oz';

  @override
  String get kgUnit => 'kg';

  @override
  String get lbUnit => 'lb';

  @override
  String get settingsPageTitle => 'Configurações';
}
