import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hidroly/controllers/setup_controller.dart';
import 'package:hidroly/domain/models/enum/frequency.dart';
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

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  late SetupController setupController;

  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final isMetric = ValueNotifier(true);
  final wakeUpTime = ValueNotifier(TimeOfDay(hour: 6, minute: 0));
  final sleepTime = ValueNotifier(TimeOfDay(hour: 22, minute: 0));
  final frequency = ValueNotifier(Frequency.every2Hours);

  int setupStep = 0;

  @override
  void initState() {
    super.initState();

    setupController = SetupController(
      dayProvider: context.read<DayProvider>(),
      customCupsProvider: context.read<CustomCupsProvider>(),
      settingsProvider: context.read<SettingsProvider>(),
    );
  }

  @override
  void dispose() {    
    super.dispose();

    ageController.dispose();
    weightController.dispose();

    isMetric.dispose();
    wakeUpTime.dispose();
    sleepTime.dispose();
    frequency.dispose();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(!formKey.currentState!.validate()) return;

          if(setupStep == 0) {
            _changeSetupStep();
            return;
          }

          await setupController.saveSettings(
            context,
            isMetric,
            wakeUpTime,
            sleepTime,
            frequency
          );

          int? dailyGoal = _getDailyGoal();
          if(dailyGoal == null) return;


          if(!context.mounted) return;
          final dayCreated = await setupController.createDay(context, dailyGoal);
          final defaultCupsCreated = await setupController.createDefaultCups();

          if(!context.mounted) return;
          final notificationTaskCreated = await NotificationService().registerPeriodicNotificationTask(
            context,
            wakeUpTime.value,
            sleepTime.value,
            frequencyInMinutes: frequency.value.frequency,
          );

          if(!notificationTaskCreated && context.mounted) {
            _showSnackBar(
              context, 
              AppLocalizations.of(context)!.notificationTaskCreationFailed
            );

            return;
          }

          if((!dayCreated || !defaultCupsCreated) && context.mounted) {
            _showSnackBar(
              context, 
              AppLocalizations.of(context)!.setupFailed
            );

            return;
          }

          if(!context.mounted) return;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }

  void _changeSetupStep() {
    setState(() {
      setupStep = 1;
    });
    
    if(Platform.isAndroid) {
      setupController.requestAndroidNotificationPermission();
    }
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
        text,
      )),
    );
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