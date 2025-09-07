// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get addAction => 'Adicionar';

  @override
  String get cancelAction => 'Cancelar';

  @override
  String get deleteAction => 'Deletar';

  @override
  String get doNotSaveLabel => 'Não salvar';

  @override
  String get editAction => 'Editar';

  @override
  String get rearrangeAction => 'Reorganizar';

  @override
  String get updateAction => 'Atualizar';

  @override
  String get manageAction => 'Gerenciar';

  @override
  String get bottomNavHomeLabel => 'Home';

  @override
  String get bottomNavSummaryLabel => 'Resumo';

  @override
  String get customCupButton => 'Personalizado';

  @override
  String get customCupDialogTextFieldAmount => 'Quantidade';

  @override
  String get customCupDialogTitle => 'Adicionar copo personalizado';

  @override
  String get editCustomCupDialogTitle => 'Editar copo personalizado';

  @override
  String get editCustomCupFailed =>
      'Não foi possível editar o copo. Por favor, reporte o erro no GitHub e mencione o código \'ECE01\'.';

  @override
  String get editCustomCupSuccess => 'Copo editado com sucesso!';

  @override
  String get dailyGoal => 'Meta diária';

  @override
  String get dailyGoalUpdated => 'Meta diária salva com sucesso';

  @override
  String dayHistoryBottomSheetItemSubtitle(String time) {
    return 'adicionado às $time';
  }

  @override
  String get dayHistoryBottomSheetNoItems => 'Nada por aqui :(';

  @override
  String get dayHistoryBottomSheetTitle => 'Histórico do dia';

  @override
  String get dayLoadingFailed => 'Dia não encontrado';

  @override
  String get notificationTaskCreationFailed =>
      'Falha ao criar a tarefa de notificação';

  @override
  String get pageNotAvailableDescription =>
      'Desculpa, essa página ainda não está disponível :(';

  @override
  String get pageNotAvailableTitle => 'Indisponível';

  @override
  String get setupFailed =>
      'Ocorreu um erro. Por favor, crie uma issue no GitHub e mencione o código \'SE01\'.';

  @override
  String get sleepScheduleEditFailed =>
      'Não foi possível salvar seu horário de sono';

  @override
  String get textFieldAmountError => 'Quantidade inválida';

  @override
  String get valueNotSupported => 'Valor não suportado';

  @override
  String get waterAddFailed =>
      'Ops! Não foi possível adicionar sua água. Tentar novamente?';

  @override
  String get homePageTodayAppBarTitle => 'Hoje';

  @override
  String get notificationSetupDescription =>
      'Vamos ajustar as notificações para combinar com seu dia';

  @override
  String get notificationSetupTitle => 'Notificações';

  @override
  String get notificationsSettingsSleep => 'Você dorme às';

  @override
  String get notificationsSettingsWakeUp => 'Você acorda às';

  @override
  String get reminderNotificationBody => 'Cuide do seu corpo, tome um gole!';

  @override
  String get reminderNotificationTitle => '💧 Hora de se hidratar!';

  @override
  String get progressCircleOf => 'de';

  @override
  String get settingsAboutSection => 'Sobre';

  @override
  String get settingsContribute => 'Contribuir';

  @override
  String get settingsContributeDescription => 'Acesse o repositório no GitHub';

  @override
  String get settingsFeedback => 'Enviar feedback';

  @override
  String get settingsFeedbackDescription =>
      'Compartilhe suas ideias com a gente';

  @override
  String get settingsGeneralSection => 'Geral';

  @override
  String get settingsPageTitle => 'Configurações';

  @override
  String get settingsSetCustomDailyGoal => 'Definir meta diária personalizada';

  @override
  String get settingsSleepSchedule => 'Editar horário de sono';

  @override
  String get settingsSleepScheduleAppBar => 'Editar horário de sono';

  @override
  String get settingsSleepScheduleDescription =>
      'A gente só precisa de alguns detalhes para atualizar seu horário de sono';

  @override
  String get settingsSleepScheduleTitle => 'Horário de Sono';

  @override
  String get settingsUnitSystem => 'Sistema de unidades';

  @override
  String get settingsUpdateDailyGoalAppBar => 'Atualizar meta';

  @override
  String get settingsUpdateDailyGoalDescription =>
      'A gente só precisa de alguns detalhes para atualizar sua meta';

  @override
  String get settingsUpdateDailyGoalTitle => 'Meta Diária';

  @override
  String get settingsUpdateYourDailyGoal => 'Atualizar meta diária';

  @override
  String get settingsYouSection => 'Você';

  @override
  String get settingsNotificationsSection => 'Notificações';

  @override
  String get settingsNotificationsManageDescription =>
      'Ativar/desativar notificações';

  @override
  String get settingsNotificationsSleepScheduleDescription =>
      'Horário de acordar/dormir & frequência';

  @override
  String get settingsNotificationsFrequency => 'Frequência';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsHapticFeedback => 'Haptic Feedback';

  @override
  String get setupAgeTextFieldInvalidValue => 'Idade entre 10 e 120';

  @override
  String get setupAgeTextFieldLabel => 'Sua idade';

  @override
  String get setupDataText => 'Seus dados são armazenados no seu dispositivo.';

  @override
  String get setupUnitImperial => 'lb, fl oz';

  @override
  String get setupUnitMetric => 'kg, ml';

  @override
  String setupWeightTextFieldInvalidWeight(String minWeight, String maxWeight) {
    return 'Peso entre $minWeight e $maxWeight';
  }

  @override
  String get setupWeightTextFieldLabel => 'Seu peso';

  @override
  String get setupWelcomeSubtitle =>
      'Só precisamos configurar algumas coisas. Vai ser rápido e fácil!';

  @override
  String get setupWelcomeTitle => 'Bem-vindo';

  @override
  String get flOzUnit => 'fl oz';

  @override
  String get imperial => 'Imperial';

  @override
  String get kgUnit => 'kg';

  @override
  String get lbUnit => 'lb';

  @override
  String get metric => 'Métrico';

  @override
  String get mlUnit => 'ml';

  @override
  String minutes(String time) {
    return '$time minutos';
  }

  @override
  String hour(String time) {
    return '$time hora';
  }

  @override
  String hours(String time) {
    return '$time horas';
  }

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Escuro';
}
