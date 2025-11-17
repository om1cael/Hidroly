import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/ui/settings/view_models/pages/settings_update_daily_goal_page_view_model.dart';
import 'package:hidroly/widgets/common/daily_goal_input.dart';
import 'package:hidroly/widgets/common/icon_header.dart';

class SettingsUpdateDailyGoalPage extends StatefulWidget {
  final bool isMetric;
  final SettingsUpdateDailyGoalPageViewModel viewModel;

  const SettingsUpdateDailyGoalPage({
    super.key,
    required this.isMetric,
    required this.viewModel,
  });

  @override
  State<SettingsUpdateDailyGoalPage> createState() => _SettingsUpdateDailyGoalPageState();
}

class _SettingsUpdateDailyGoalPageState extends State<SettingsUpdateDailyGoalPage> {
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late ValueNotifier<bool> isMetricNotifier;

  @override
  void initState() {
    super.initState();
    isMetricNotifier = ValueNotifier<bool>(widget.isMetric);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsUpdateDailyGoalAppBar),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
            semanticLabel: AppLocalizations.of(context)!.goBackIconSemanticLabel,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    IconHeader(
                      iconAsset: 'assets/images/water-drop.svg', 
                      title: AppLocalizations.of(context)!.settingsUpdateDailyGoalTitle, 
                      description: AppLocalizations.of(context)!.settingsUpdateDailyGoalDescription
                    ),
                    DailyGoalInput(
                      ageController: ageController, 
                      weightController: weightController,
                      isMetric: isMetricNotifier,
                      showUnitToggleSwitch: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(!formKey.currentState!.validate()) return;

          final isUpdateDone = widget.viewModel.updateDailyGoal(
            ageController.text,
            weightController.text,
            widget.isMetric
          );

          if(!isUpdateDone) {
            return;
          }

          Navigator.of(context).pop(true);
        },
        child: Icon(
          Icons.done,
          semanticLabel: AppLocalizations.of(context)!.saveChangesIconSemanticLabel,
        ), 
      ),
    );
  }
}