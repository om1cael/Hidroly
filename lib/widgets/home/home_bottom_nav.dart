import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Theme.of(context).colorScheme.surface,
      ), 
      child: BottomNavigationBar(
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