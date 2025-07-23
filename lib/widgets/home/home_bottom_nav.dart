import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';

class HomeBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const HomeBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Theme.of(context).colorScheme.surface,
      ), 
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: AppLocalizations.of(context)!.bottomNavHomeLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.show_chart
            ),
            label: AppLocalizations.of(context)!.bottomNavSummaryLabel,
          )
        ]
      ),
    );
  }
}