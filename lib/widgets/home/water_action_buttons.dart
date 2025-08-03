import 'package:flutter/material.dart';
import 'package:hidroly/data/model/history_entry.dart';
import 'package:hidroly/data/model/water_button.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:provider/provider.dart';

class WaterActionButtons extends StatelessWidget {
  WaterActionButtons({
    super.key,
    required this.dayId,
    required this.isMetric,
  });

  final int dayId;
  final bool isMetric;
  final _defaultButtons = [WaterButton(amount: 250), WaterButton(amount: 350)];

  @override
  Widget build(BuildContext context) {
    final List<WaterButton> customCups = 
      context.watch<CustomCupsProvider>().customCups;
    
    List<WaterButton> allButtons = [
      ..._defaultButtons,
      ...customCups,
    ];

    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var button = allButtons[index];

          return ElevatedButton.icon(
            onPressed: () async {
              final int amount = button.amount;
              await addWater(context, amount);

              if(!context.mounted) return;
              await saveWaterToHistory(context, amount);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff31333A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16)
              ),
            ),
            icon: Icon(Icons.water_drop),
            label: Text(
              UnitTools.getVolumeWithUnit(button.amount, isMetric, context: context),
              style: TextStyle(
                color: AppColors.secondaryText
              ),
            ),
          );
        }, 
        separatorBuilder: (context, index) => SizedBox(width: 10,), 
        itemCount: allButtons.length
      ),
    );
  }

  Future<bool> addWater(BuildContext context, int amount) async {
    final success = await context
        .read<DayProvider>()
        .addWater(amount);
    
    if(!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.waterAddFailed)
        )
      );
    }

    return success;
  }

  Future<void> saveWaterToHistory(BuildContext context, int amount) async {
    await context.read<DailyHistoryProvider>().create(
      HistoryEntry(
        dayId: dayId, 
        amount: amount, 
        dateTime: DateTime.now().toUtc()
      )
    );
  }
}