import 'package:flutter/material.dart';
import 'package:hidroly/pages/setup_page.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/widgets/home/daily_history_bottom_sheet.dart';
import 'package:hidroly/widgets/home/home_bottom_nav.dart';
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

  @override
  void initState() {
    super.initState();
    _loadDay();
    _loadCustomCups();
    _loadDailyHistory();
  }

  @override
  void dispose() {
    customCupAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(context.watch<DayProvider>().day == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: HomeBottomNav(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              spacing: 50,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WaterProgressCircle(),
                WaterActionButtons(
                  customCupAmountController: customCupAmountController,
                  formKey: formKey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Today',
      ),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context, 
              builder: (builder) {
                return DailyHistoryBottomSheet();
              }
            );
          }, 
          icon: Icon(
            Icons.list, 
            color: AppColors.primaryText,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
        ),
        IconButton(
          onPressed: () {}, 
          icon: Icon(
            Icons.settings, 
            color: AppColors.primaryText,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }

  void _loadDay() async {
    final provider = context.read<DayProvider>();

    await provider.findLatest();
    if(provider.day == null && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SetupPage()),
      );
      return;
    }
  }

  void _loadCustomCups() async {
    await context.read<CustomCupsProvider>().loadCustomCups();
  }

  void _loadDailyHistory() async {
    await context.read<DailyHistoryProvider>().getAll(1);
  }
}