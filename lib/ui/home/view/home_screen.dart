import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/ui/home/view_models/home_view_model.dart';
import 'package:hidroly/ui/setup/view/setup_screen.dart';
import 'package:hidroly/ui/summary/view/summary_screen.dart';
import 'package:hidroly/ui/water_tracking/view/water_tracking_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [WaterTrackingScreen(), SummaryScreen()];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final viewModel = HomeViewModel(
        dayProvider: context.read(),
        settingsProvider: context.read(),
      );

      bool initialized = 
        await viewModel.initializeData();
      
      if(!initialized && mounted) {
        Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => SetupScreen()));
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.bottomNavHomeLabel,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: AppLocalizations.of(context)!.bottomNavSummaryLabel,
            ),
          ],
          onTap: (newIndex) => setState(() {
            if(newIndex == 1) {
              // Force the SummaryScreen lifecycle to start over
              // So we can get the last statistics on the initState method
              _screens.removeAt(1);
              _screens.insert(1, SummaryScreen(key: UniqueKey(),));
            }

            _currentIndex = newIndex;
          }),
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}