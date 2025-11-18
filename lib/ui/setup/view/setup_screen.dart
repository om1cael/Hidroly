import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidroly/ui/setup/view_models/setup_view_model.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/ui/setup/view/steps/setup_notifications_step.dart';
import 'package:hidroly/ui/setup/view/steps/setup_basic_info_step.dart';

class SetupScreen extends StatefulWidget {
  final SetupViewModel viewModel;

  const SetupScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int setupStep = 0;

  @override
  void dispose() {    
    super.dispose();

    ageController.dispose();
    weightController.dispose();
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
                ? SetupBasicInfoStep(
                  ageController: ageController, 
                  weightController: weightController, 
                  isMetric: widget.viewModel.isMetricNotifier
                )
                : SetupNotificationsStep(
                  wakeUpTime: widget.viewModel.wakeUpTime,
                  sleepTime: widget.viewModel.sleepTime,
                  frequency: widget.viewModel.frequency,
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

          await widget.viewModel.saveSettings(context);

          int? dailyGoal = widget.viewModel.getDailyGoal(
            ageController.text,
            weightController.text,
          );
          
          if(dailyGoal == null) return;

          if(!context.mounted) return;
          final dayCreated = await widget.viewModel.createDay(context, dailyGoal);
          final defaultCupsCreated = await widget.viewModel.createDefaultCups();

          if(!context.mounted) return;
          final notificationTaskCreated = 
            await widget.viewModel.registerPeriodicNotificationTask(context);

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
          context.go('/');
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
      widget.viewModel.requestAndroidNotificationPermission();
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