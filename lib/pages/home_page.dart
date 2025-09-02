import 'package:flutter/material.dart';
import 'package:hidroly/controllers/home_controller.dart';
import 'package:hidroly/domain/models/day.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings_page.dart';
import 'package:hidroly/pages/setup_page.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:hidroly/widgets/home/daily_history_bottom_sheet.dart';
import 'package:hidroly/widgets/home/fab_home.dart';
import 'package:hidroly/widgets/home/water_action_buttons.dart';
import 'package:hidroly/widgets/home/water_progress_circle.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool initialized = await homeController.initializeHome(context);
      
      if(!initialized && mounted) {
        Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => SetupPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Day? currentDay = context.watch<DayProvider>().day;
    final bool isMetric = context.watch<SettingsProvider>().isMetric;

    final int? dayId = currentDay?.id;

    if(currentDay == null || dayId == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }

    return Scaffold(
      appBar: appBar(currentDay, dayId, isMetric),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              spacing: 32,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WaterProgressCircle(),
                WaterActionButtons(
                  dayId: dayId,
                  isMetric: isMetric,
                )
              ],
            )
          ),
        ),
      ),
      floatingActionButton: FabHome(
        dayId: dayId,
        isMetric: isMetric
      ),
    );
  }

  AppBar appBar(Day currentDay, int dayId, bool isMetric) {
    return AppBar(
      title: TextButton(
        onPressed: () async {
          final provider = context.read<DayProvider>();
          final firstDate = await provider.findFirst();
          final latestDate = await provider.findLatest();

          if(!mounted || firstDate == null || latestDate == null) return;

          DateTime? pickedDate = 
            await _selectDateForDayHistory(latestDate, firstDate);

          if(pickedDate == null) return;
          await _loadSelectedDay(provider, pickedDate);

          if(!mounted) return;
          await homeController.loadDailyHistory(context, currentDay: provider.day);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppDateUtils.formatDayTitle(
                currentDay.date.toLocal(),
                context: context,
                todayText: AppLocalizations.of(context)!.homePageTodayAppBarTitle
              ),
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            Icon(
              Icons.arrow_drop_down
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context, 
              builder: (builder) {
                return DailyHistoryBottomSheet(
                  dayId: dayId,
                  isMetric: isMetric,
                );
              }
            );
          }, 
          icon: Icon(
            Icons.history,
            color: Theme.of(context).iconTheme.color,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
        ),
        IconButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsPage()
              )
            );
          }, 
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).iconTheme.color,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }

  Future<DateTime?> _selectDateForDayHistory(Day latestDate, Day firstDate) async {
    return await showDatePicker(
      context: context,
      initialDate: latestDate.date.toLocal(),
      firstDate: firstDate.date.toLocal(),
      lastDate: latestDate.date.toLocal(),
      builder:(context, child) {
        return Theme(
          data: Theme.of(context).brightness == Brightness.dark 
            ? Theme.of(context).copyWith(
                colorScheme: ColorScheme.dark(
                  primary: AppColors.blueAccent,
                  onSurface: AppColors.primaryText,
                ))
            : Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColorsLight.blueAccent,
                  onSurface: AppColorsLight.primaryText,
              ),
          ),
          child: child!,
        );
      },
    );
  }

  Future<void> _loadSelectedDay(DayProvider provider, DateTime pickedDate) async {
    final selectedDay = await provider.findByDate(pickedDate);

    if(selectedDay == null && mounted) {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          content: Text(
            AppLocalizations.of(context)!.dayLoadingFailed,
          ),
        )
      );
      return;
    }

    provider.day = selectedDay;
  }
}