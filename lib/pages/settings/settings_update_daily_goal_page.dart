import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:hidroly/widgets/common/daily_goal_input.dart';
import 'package:hidroly/widgets/common/icon_header.dart';
import 'package:provider/provider.dart';

class SettingsUpdateDailyGoalPage extends StatefulWidget {
  final bool isMetric;

  const SettingsUpdateDailyGoalPage({
    super.key,
    required this.isMetric,
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

          final dayProvider = context.read<DayProvider>();
          final currentDay = dayProvider.day;
          if(currentDay == null) return;

          final age = int.parse(ageController.text);
          int weight = int.parse(weightController.text);

          if(!isMetricNotifier.value) {
            weight = UnitTools.lbToKg(weight);
          }

          final newDailyGoal = CalculateDailyGoal().calculate(age, weight);

          dayProvider.update(
            currentDay.copyWith(
              dailyGoal: newDailyGoal,
            ),
          );

          Navigator.of(context).pop(true);
        },
        child: Icon(Icons.done), 
      ),
    );
  }
}