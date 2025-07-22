import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:hidroly/widgets/common/icon_header.dart';
import 'package:hidroly/widgets/common/daily_goal_input.dart';
import 'package:hidroly/widgets/common/notifications_time_input.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> isMetric = ValueNotifier(true);
  final wakeUpTime = ValueNotifier(TimeOfDay(hour: 6, minute: 0));
  final sleepTime = ValueNotifier(TimeOfDay(hour: 22, minute: 0));

  int setupStep = 0;

  @override
  void dispose() {
    ageController.dispose();
    weightController.dispose();
    isMetric.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 64),
              child: setupStep == 0
                ? SetupStepZero(
                  ageController: ageController, 
                  weightController: weightController, 
                  isMetric: isMetric
                )
                : Column(
                  spacing: 32,
                  children: [
                    IconHeader(
                      iconAsset: 'assets/images/water-drop.svg', 
                      title: AppLocalizations.of(context)!.notificationSetupTitle, 
                      description: AppLocalizations.of(context)!.notificationSetupDescription,
                    ),
                    NotificationsTimeInput(
                      wakeUpTime: wakeUpTime,
                      sleepTime: sleepTime,
                    )
                  ],
                )
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton.filled(
        onPressed: () async {
          if(!formKey.currentState!.validate()) return;
          if(setupStep == 0) {
            setState(() {
              setupStep = 1;
            });
            return;
          }

          final settingsProvider = context.read<SettingsProvider>();

          await _saveSettings(context);

          int? dailyGoal = _getDailyGoal();
          if(dailyGoal == null) return;

          if(!context.mounted) return;
          final created = await _createDay(context, dailyGoal);

          if(created && context.mounted) {
            _registerPeriodicNotificationTask(settingsProvider);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        },
        icon: Icon(
          Icons.arrow_forward,
        ),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        padding: EdgeInsets.all(18),
      ),
    );
  }

  void _registerPeriodicNotificationTask(SettingsProvider settingsProvider) {
    final formattedWakeUpTime = AppDateUtils.formatTime(
      settingsProvider.wakeUpTime!.hour, 
      settingsProvider.wakeUpTime!.minute
    );

    final formattedSleepTime = AppDateUtils.formatTime(
      settingsProvider.sleepTime!.hour, 
      settingsProvider.sleepTime!.minute
    );
    
    Workmanager().registerPeriodicTask(
      'notification',
      'notificationTask',
      frequency: Duration(hours: 2),
      initialDelay: Duration(minutes: 1),
      inputData: {
        Settings.wakeUpTime.value: formattedWakeUpTime,
        Settings.sleepTime.value: formattedSleepTime,
      }
    );
  }

  Future<void> _saveSettings(BuildContext context) async {
    final settingsProvider = context.read<SettingsProvider>();
    
    await settingsProvider.updateIsMetric(isMetric.value);
    
    await settingsProvider.updateTime(
      Settings.wakeUpTime,
      wakeUpTime.value.hour, 
      wakeUpTime.value.minute
    );

    await settingsProvider.updateTime(
      Settings.sleepTime,
      sleepTime.value.hour, 
      sleepTime.value.minute
    );
  }

  Future<bool> _createDay(BuildContext context, int dailyGoal) async {
    final localDate = DateTime.now();
    
    bool created = await context.read<DayProvider>().create(
      localDate,
      dailyGoal,
    );
    return created;
  }

  int? _getDailyGoal() {
    int? age = int.tryParse(ageController.text);
    int? weight = int.tryParse(weightController.text);

    if(age == null || weight == null) return null;

    if(isMetric.value == false) {
      weight = UnitTools.lbToKg(weight);
    }
    
    return CalculateDailyGoal().calculate(age, weight);
  }
}

class SetupStepZero extends StatelessWidget {
  const SetupStepZero({
    super.key,
    required this.ageController,
    required this.weightController,
    required this.isMetric,
  });

  final TextEditingController ageController;
  final TextEditingController weightController;
  final ValueNotifier<bool> isMetric;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconHeader(
          iconAsset: 'assets/images/water-drop.svg', 
          title: AppLocalizations.of(context)!.setupWelcomeTitle, 
          description: AppLocalizations.of(context)!.setupWelcomeSubtitle,
        ),
        DailyGoalInput(
          ageController: ageController,
          weightController: weightController,
          isMetric: isMetric,
        ),
        Text(
          AppLocalizations.of(context)!.setupDataText,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}