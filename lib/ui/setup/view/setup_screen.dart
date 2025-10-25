import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hidroly/ui/setup/view_models/setup_view_model.dart';
import 'package:hidroly/domain/models/enum/frequency.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/data/services/notifications/notification_service.dart';
import 'package:hidroly/ui/setup/view/steps/setup_step_one.dart';
import 'package:hidroly/ui/setup/view/steps/setup_step_zero.dart';
import 'package:provider/provider.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  late SetupViewModel _viewModel;

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

    _viewModel = SetupViewModel(
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

          await _viewModel.saveSettings(
            context,
            isMetric,
            wakeUpTime,
            sleepTime,
            frequency
          );

          int? dailyGoal = _viewModel.getDailyGoal(
            ageController, 
            weightController, 
            isMetric
          );
          
          if(dailyGoal == null) return;


          if(!context.mounted) return;
          final dayCreated = await _viewModel.createDay(context, dailyGoal);
          final defaultCupsCreated = await _viewModel.createDefaultCups();

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
      _viewModel.requestAndroidNotificationPermission();
    }
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
        text,
      )),
    );
  }
}