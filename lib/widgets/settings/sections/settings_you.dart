import 'package:flutter/material.dart';
import 'package:hidroly/data/model/day.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings/settings_update_daily_goal_page.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:hidroly/widgets/input/number_input_dialog.dart';
import 'package:hidroly/widgets/settings/settings_text_button.dart';
import 'package:provider/provider.dart';

class SettingsYou extends StatefulWidget {  
  final bool isMetric;

  const SettingsYou({
    super.key,
    required this.isMetric,
  });

  @override
  State<SettingsYou> createState() => _SettingsYouState();
}

class _SettingsYouState extends State<SettingsYou> {
  final TextEditingController dailyGoalTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    dailyGoalTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DayProvider>();
    final day = provider.day;
    String? dailyGoalDescription;

    if(day != null) {
      final dailyGoal = day.dailyGoal;
      dailyGoalDescription = UnitTools.getVolumeWithUnit(dailyGoal, widget.isMetric);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.settingsYouSection,
          style: TextStyle(
            color: Theme.of(context).textTheme.labelLarge!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.settingsUpdateYourDailyGoal,
          description: dailyGoalDescription,
          onPressed: () async {
            final setNewDailyGoal = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SettingsUpdateDailyGoalPage(
                isMetric: widget.isMetric,
              )),
            );

            if((setNewDailyGoal != null && setNewDailyGoal) && context.mounted) {
              _showDailyGoalUpdateSnackBar(context);
            }
          },
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.settingsSetCustomDailyGoal,
          onPressed: () => _showCustomDailyGoalDialog(provider, day),
        ),
      ],
    );
  }

  void _showDailyGoalUpdateSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(context)!.dailyGoalUpdated,
        ),
      ),
    );
  }

  void _showCustomDailyGoalDialog(DayProvider provider, Day? day) {
    showDialog(
      context: context, 
      builder: (_) {
        return Form(
          key: formKey,
          child: NumberInputDialog(
            title: AppLocalizations.of(context)!.settingsSetCustomDailyGoal,
            inputFieldLabel: AppLocalizations.of(context)!.dailyGoal,
            actionButtonText: AppLocalizations.of(context)!.updateAction,
            cancelButtonText: AppLocalizations.of(context)!.cancelAction,
            textEditingController: dailyGoalTextController, 
            inputFieldValidator: (value) {
              double? amount = double.tryParse(value ?? '');
              if(amount == null || amount <= 0) {
                return AppLocalizations.of(context)!.textFieldAmountError;
              }
              return null;
            }, 
            onActionPressed: () async {
              if(!formKey.currentState!.validate() || day == null) return;

              double? dailyGoal = double.tryParse(dailyGoalTextController.text);
              if(dailyGoal == null) return;

              int normalizedDailyGoal = widget.isMetric
                ? dailyGoal.round()
                : UnitTools.flOzToMl(dailyGoal);

              await provider.update(
                day.copyWith(
                  dailyGoal: normalizedDailyGoal.round(),
                )
              );

              if(!mounted) return;
              _closeAndClearDialog(context, dailyGoalTextController);
              _showDailyGoalUpdateSnackBar(context);
            }, 
            onCancelPressed: () {
              _closeAndClearDialog(context, dailyGoalTextController);
            },
          ),
        );
      }
    );
  }

  void _closeAndClearDialog(BuildContext context, TextEditingController textEditingController) {
    Navigator.of(context).pop();
    textEditingController.clear();
  }
}