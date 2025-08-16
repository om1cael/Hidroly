import 'package:flutter/material.dart';
import 'package:hidroly/data/model/day.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings_page.dart';
import 'package:hidroly/pages/setup_page.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/theme/app_theme.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:hidroly/widgets/home/daily_history_bottom_sheet.dart';
import 'package:hidroly/widgets/home/fab_custom_cup.dart';
import 'package:hidroly/widgets/home/water_action_buttons.dart';
import 'package:hidroly/widgets/home/water_progress_circle.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController customCupAmountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController waterButtonsUpdateDialogTextController = TextEditingController();
  final GlobalKey<FormState> waterButtonsUpdateDialogFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeHome();
    });
  }

  @override
  void dispose() {
    customCupAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Day? currentDay = context.watch<DayProvider>().day;
    final int? dayId = currentDay?.id;

    final bool? isMetric = context.watch<SettingsProvider>().isMetric;

    if(currentDay == null || dayId == null || isMetric == null) {
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
                WaterProgressCircle(
                  isMetric: isMetric,
                ),
                WaterActionButtons(
                  formKey: waterButtonsUpdateDialogFormKey,
                  updateDialogTextController: waterButtonsUpdateDialogTextController,
                  dayId: dayId,
                  isMetric: isMetric,
                )
              ],
            )
          ),
        ),
      ),
      floatingActionButton: FabCustomCup(
        dayId: dayId,
        customCupAmountController: customCupAmountController,
        formKey: formKey,
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

          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: latestDate.date.toLocal(),
            firstDate: firstDate.date.toLocal(),
            lastDate: latestDate.date.toLocal(),
            builder:(context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.dark(
                    primary: AppColors.blueAccent,
                    onSurface: AppColors.primaryText,
                  ),
                ),
                child: child!,
              );
            },
          );

          if(pickedDate == null) return;

          final loadedDay = await provider.findByDate(pickedDate);
          if(loadedDay == null && mounted) {
            ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(
                content: Text(
                  AppLocalizations.of(context)!.dayLoadingFailed,
                ),
              )
            );
            return;
          }

          provider.day = loadedDay;
          _loadDailyHistory(currentDay: provider.day);
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

  Future<void> _initializeHome() async {
    await _loadDay();
    await _createDayIfNewDate();
    await _loadCustomCups();
    await _loadDailyHistory();
    await _loadSettings();
  }

  Future<void> _createDayIfNewDate() async {
    await context.read<DayProvider>().createAndLoadIfNewDay();
  }

  Future<void> _loadDay() async {
    final provider = context.read<DayProvider>();
    final latestDay = await provider.findLatest();

    if(latestDay == null && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SetupPage()),
      );
      return;
    }

    provider.day = latestDay;
  }

  Future<void> _loadCustomCups() async {
    await context.read<CustomCupsProvider>().loadCustomCups();
  }

  Future<void> _loadDailyHistory({Day? currentDay}) async {
    currentDay ??= context.read<DayProvider>().day;

    // TODO: Maybe return to the setup page?
    if(currentDay == null) return;
    
    final dayId = currentDay.id!;
    await context.read<DailyHistoryProvider>().getAll(dayId);
  }
  
  Future<void> _loadSettings() async {
    final settingsProvider = context.read<SettingsProvider>();

    await settingsProvider.readIsMetric();
    await settingsProvider.readTime(Settings.wakeUpTime);
    await settingsProvider.readTime(Settings.sleepTime);
  }
}