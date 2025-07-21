import 'package:flutter/material.dart';
import 'package:hidroly/service/settings_service.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';
import 'package:hidroly/utils/unit_converter.dart';
import 'package:hidroly/widgets/setup/setup_header.dart';
import 'package:hidroly/widgets/setup/setup_interactable.dart';
import 'package:provider/provider.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final SettingsService settingsService = SettingsService();
  final ValueNotifier<bool> isMetric = ValueNotifier(true);

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
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 64),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SetupHeader(),
                  SetupInteractable(
                    ageController: ageController,
                    weightController: weightController,
                    isMetric: isMetric,
                  ),
                  Text(
                    AppLocalizations.of(context)!.setupDataText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton.filled(
        onPressed: () async {
          if(!formKey.currentState!.validate()) return;
          await settingsService.updateIsMetric(isMetric.value);

          int? dailyGoal = _getDailyGoal();
          if(dailyGoal == null) return;

          if(!context.mounted) return;
          final created = await _createDay(context, dailyGoal);

          if(created && context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            return;
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
      weight = UnitConverter.lbToKg(weight);
    }
    
    return CalculateDailyGoal().calculate(age, weight);
  }
}