import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hidroly/data/model/enum/frequency.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/data/model/water_button.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/services/notification_service.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:hidroly/widgets/setup/setup_step_one.dart';
import 'package:hidroly/widgets/setup/setup_step_zero.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqlite_api.dart';

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
  final frequency = ValueNotifier(Frequency.every2Hours);

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
                : SetupStepOne(
                  wakeUpTime: wakeUpTime, 
                  sleepTime: sleepTime,
                  frequency: frequency,
                ),
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

            if(!Platform.isAndroid) return;

            FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
              FlutterLocalNotificationsPlugin();
            flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
            return;
          }

          final settingsProvider = context.read<SettingsProvider>();

          await _saveSettings(context);

          int? dailyGoal = _getDailyGoal();
          if(dailyGoal == null) return;

          if(!context.mounted) return;
          final dayCreated = await _createDay(context, dailyGoal);

          if(!context.mounted) return;
          final defaultCupsCreated = await _createDefaultCups();

          if(!context.mounted) return;
          final notificationTaskCreated = await NotificationService().registerPeriodicNotificationTask(
            context,
            settingsProvider
          );

          if(!notificationTaskCreated && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(
                AppLocalizations.of(context)!.notificationTaskCreationFailed,
              )),
            );

            return;
          }

          if((!dayCreated || !defaultCupsCreated) && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(
                AppLocalizations.of(context)!.setupFailed,
              )),
            );

            return;
          }

          if(!context.mounted) return;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
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

  Future<bool> _createDefaultCups() async {
    final defaultCups = [
      WaterButton(amount: 250),
      WaterButton(amount: 300),
      WaterButton(amount: 600),
    ];

    try {
      for(WaterButton cup in defaultCups) {
        await context.read<CustomCupsProvider>()
          .createCustomCup(cup.amount);
      }
    } on DatabaseException {
      return false;
    }

    return true;
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